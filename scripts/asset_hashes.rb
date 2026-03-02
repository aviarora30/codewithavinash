#!/usr/bin/env ruby
# Generates content-hashed CSS filenames and writes _data/asset_hashes.yml
# so the layout can reference them. Run before `jekyll build` (e.g. in CI).
# Usage: ruby scripts/asset_hashes.rb (run from repo root)

require "digest"
require "fileutils"

def hash_file(path)
  Digest::SHA256.hexdigest(File.read(path))[0, 8]
end

styles_path = "styles.css"
notes_path = "notes/notes.css"

abort("styles.css not found") unless File.exist?(styles_path)
abort("notes/notes.css not found") unless File.exist?(notes_path)

hash_styles = hash_file(styles_path)
hash_notes = hash_file(notes_path)

# Remove previous hashed CSS so only the latest remains (for a clean repo)
Dir.glob("styles.[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f].css").each { |f| File.delete(f) }
Dir.glob("notes/notes.[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f].css").each { |f| File.delete(f) }

# Write hashed CSS files (same content, hashed filename)
File.write("styles.#{hash_styles}.css", File.read(styles_path))
FileUtils.mkdir_p("notes")
File.write("notes/notes.#{hash_notes}.css", File.read(notes_path))

# Write data file for Jekyll layout
FileUtils.mkdir_p("_data")
File.write("_data/asset_hashes.yml", <<~YAML)
  ---
  styles: styles.#{hash_styles}.css
  notes_css: notes/notes.#{hash_notes}.css
YAML

puts "Asset hashes written: styles.#{hash_styles}.css, notes/notes.#{hash_notes}.css"
