# Code With Avinash

A personal website showcasing the work and insights of Avinash Arora, an engineering leader with 17 years of experience building frontend systems and teams.

## Project Structure

```
.
├── CNAME                 # Domain configuration for GitHub Pages
├── _config.yml           # Jekyll configuration
├── _includes/            # Shared header/footer
├── _layouts/             # Page and note layouts
├── _notes/               # Notes collection (markdown)
├── index.html            # Home page (Jekyll front matter)
├── styles.css            # Main stylesheet
├── assets/               # Images and media files
├── about/
│   └── index.html        # About page
├── notes/
│   ├── index.html        # Notes listing page
│   └── notes.css         # Note-specific styles
├── robots.txt            # Crawl directives
├── sitemap.xml           # Generated sitemap (Jekyll)
├── sitemap/              # Human-readable sitemap page
└── README.md             # Project documentation
```

## Pages

The site has a home page, an about page, and a **notes** section. The notes index at `/notes` lists all articles; each note is a Markdown file in `_notes/` with YAML front matter, built by Jekyll at `/notes/:name/` using the `note` layout. Add a new `.md` in `_notes/` to publish another note.

## Styling

The site uses `styles.css` for styling all pages. Each HTML page links to this shared stylesheet.

## Build and Preview

This site uses Jekyll layouts and a `notes` collection. CSS files are built with content hashes for cache busting (e.g. `styles.a1b2c3d4.css`).

**Local preview:**

1. Generate hashed CSS, tag pages, and asset data (run from repo root):
   - `ruby scripts/asset_hashes.rb`
   - `ruby scripts/generate_tag_pages.rb`
2. Install Bundler (Ruby 2.6 users):
   - `gem install bundler -v 2.4.22`
3. Run the site:
   - `bundle _2.4.22_ exec jekyll serve`
4. Visit:
   - `http://localhost:4000`

If you’re on Ruby 3.2+, you can use the latest Bundler and run `bundle exec jekyll serve`.

**Production (GitHub Pages):** The workflow `.github/workflows/deploy-pages.yml` runs `ruby scripts/asset_hashes.rb` and `ruby scripts/generate_tag_pages.rb` before every Jekyll build on push to `main`, so you don’t need to run the scripts or commit generated files when you change CSS or notes/tags. Enable it in the repo: **Settings → Pages → Build and deployment → Source: GitHub Actions**. If the scripts haven’t run (e.g. local), the layout falls back to `styles.css` and `notes/notes.css`, and tag pages will be missing until you run the tag script.

## Hosting

This site is hosted on GitHub Pages using the custom domain configured in the `CNAME` file.

## Getting Started

Simply open `index.html` in a web browser to view the site locally, or visit the live site at [codewithavinash.com](https://codewithavinash.com)

## License

© 2026 Avinash Arora. All rights reserved.
