#!/usr/bin/env ruby
# Generates Jekyll pages under tags/<slug>/ for each tag used in published notes.
# Run before `jekyll build` (e.g. in CI). Required for GitHub Pages, which does
# not allow custom Jekyll generators.
# Usage: ruby scripts/generate_tag_pages.rb (run from repo root)

require "date"
require "fileutils"
require "yaml"

NOTES_DIR = "_notes"
TAGS_DIR = "tags"

def slugify(tag)
  tag.to_s.downcase.strip.gsub(/\s+/, "-")
end

def parse_front_matter(path)
  content = File.read(path, encoding: "UTF-8")
  return {} unless content.start_with?("---")
  parts = content.split("---", 3)
  return {} if parts.size < 2
  YAML.safe_load(parts[1], permitted_classes: [Date, Time]) || {}
rescue Psych::SyntaxError, ArgumentError, Psych::DisallowedClass
  {}
end

def published?(fm)
  fm["is_published"] != false
end

def tags_from_note(path)
  fm = parse_front_matter(path)
  return [] unless published?(fm)
  raw = fm["tags"]
  return [] unless raw.is_a?(Array)
  raw.map { |t| slugify(t) }.reject(&:empty?).uniq
end

# Collect unique tag slugs from published notes
notes_path = File.join(NOTES_DIR, "**", "*.md")
notes_glob = Dir.glob(notes_path)
tag_slugs = []
notes_glob.each do |path|
  tag_slugs.concat(tags_from_note(path))
end
tag_slugs = tag_slugs.uniq.sort

# Remove existing generated tag pages so removed tags disappear
FileUtils.rm_rf(TAGS_DIR) if Dir.exist?(TAGS_DIR)

# Write tags index page and data for listing all tags
FileUtils.mkdir_p(TAGS_DIR)
File.write(File.join(TAGS_DIR, "index.md"), {
  "layout" => "tags_index",
  "title" => "Tags",
  "permalink" => "/tags/",
  "notes_styles" => true,
}.to_yaml + "---\n")

FileUtils.mkdir_p("_data")
File.write("_data/tags.yml", { "tag_slugs" => tag_slugs }.to_yaml)

tag_slugs.each do |slug|
  dir = File.join(TAGS_DIR, slug)
  FileUtils.mkdir_p(dir)
  index_path = File.join(dir, "index.md")
  title = "Notes tagged ‘#{slug}’"
  front_matter = {
    "layout" => "tag",
    "tag" => slug,
    "title" => title,
    "permalink" => "/tags/#{slug}/",
    "notes_styles" => true,
  }
  body = ""
  content = front_matter.to_yaml + "---\n" + body
  File.write(index_path, content)
end

puts "Tag pages written: #{tag_slugs.size} tags -> #{TAGS_DIR}/"
