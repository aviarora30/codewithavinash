# Jekyll generator: builds tag index and per-tag pages from published notes.
# Used when running `jekyll serve` or `jekyll build` locally so you don't need
# to run scripts/generate_tag_pages.rb. GitHub Pages does not run plugins, so
# CI still runs that script before the build.

module Jekyll
  class TagPagesGenerator < Generator
    safe true
    priority :normal

    def slugify(tag)
      tag.to_s.downcase.strip.gsub(/\s+/, "-")
    end

    def generate(site)
      # Remove any tag pages that came from disk (e.g. from running the script) so we are the single source of truth
      site.pages.delete_if { |p| p.url.start_with?("/tags/") }

      notes = site.collections["notes"]&.docs || []
      tag_slugs = []
      notes.each do |doc|
        next if doc.data["is_published"] == false
        raw = doc.data["tags"]
        next unless raw.is_a?(Array)
        raw.each { |t| tag_slugs << slugify(t) }
      end
      tag_slugs = tag_slugs.reject(&:empty?).uniq.sort

      site.data["tags"] = { "tag_slugs" => tag_slugs }

      # Tags index page
      index = PageWithoutAFile.new(site, site.source, "tags", "index.html")
      index.data["layout"] = "tags_index"
      index.data["title"] = "Tags"
      index.data["permalink"] = "/tags/"
      index.data["notes_styles"] = true
      index.content = ""
      site.pages << index

      # Per-tag page
      tag_slugs.each do |slug|
        page = PageWithoutAFile.new(site, site.source, File.join("tags", slug), "index.html")
        page.data["layout"] = "tag"
        page.data["tag"] = slug
        page.data["title"] = "Notes tagged ‘#{slug}’"
        page.data["permalink"] = "/tags/#{slug}/"
        page.data["notes_styles"] = true
        page.content = ""
        site.pages << page
      end
    end
  end
end
