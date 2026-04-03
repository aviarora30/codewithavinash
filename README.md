# Code With Avinash

A personal website showcasing the work and insights of Avinash Arora, an engineering leader with 17 years of experience building frontend systems and teams.

## Project Structure

```
.
├── .github/workflows/    # deploy-pages.yml, scheduled-publish.yml
├── Gemfile               # Local Jekyll deps (run `bundle install` in repo root)
├── Gemfile.lock          # Locked gem versions
├── CNAME                 # Domain configuration for GitHub Pages
├── _config.yml           # Jekyll configuration (production / CI)
├── _config_dev.yml       # Merged locally only: preview future-dated notes
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
├── scripts/              # asset_hashes.rb, generate_tag_pages.rb, scheduled-publish.js
├── _plugins/             # Tag pages generator (runs on jekyll serve; CI uses script)
├── sitemap.xml           # Generated sitemap (Jekyll)
├── sitemap/              # Human-readable sitemap page
├── tags/                 # Generated tag pages (script in CI; plugin locally)
└── README.md             # Project documentation
```

## Pages

The site has a home page, an about page, and a **notes** section. The notes index at `/notes` lists all articles; each note is a Markdown file in `_notes/` with YAML front matter, built by Jekyll at `/notes/:name/` using the `note` layout. Tag pages are generated automatically when running `jekyll serve` (via `_plugins/tag_pages_generator.rb`). In CI (GitHub Pages), `scripts/generate_tag_pages.rb` runs before the build because custom plugins are not allowed there. Notes can use `publish_at` (IST) with `is_published: false`; `.github/workflows/scheduled-publish.yml` runs twice daily and on push to update published state.

## Styling

The site uses `styles.css` for styling all pages. Each HTML page links to this shared stylesheet.

## Build and Preview

This site uses Jekyll layouts and a `notes` collection. CSS files are built with content hashes for cache busting (e.g. `styles.a1b2c3d4.css`).

**Local preview:**

Run these commands from the **repository root** (the folder that contains `Gemfile` and `_config.yml`).

1. (Optional) Generate hashed CSS and asset data for production-like assets:
   - `ruby scripts/asset_hashes.rb`
2. Install Bundler (Ruby 2.6 only):
   - `gem install bundler -v 2.4.22`
3. Install gems (first time, or after `Gemfile` changes):
   - `bundle install`
4. Run the site (tag pages are generated automatically by the plugin; no need to run `generate_tag_pages.rb`). Pass **`--config _config.yml,_config_dev.yml`** so notes whose front-matter **`date` is still in the future** are built (Jekyll’s default `future: false` would skip them and URLs like `/notes/…/` would 404 locally). GitHub Pages builds use `_config.yml` only.
   - Ruby 2.6: `bundle _2.4.22_ exec jekyll serve --config _config.yml,_config_dev.yml`, or with live reload: add `--livereload`
   - Ruby 3.2+ (latest Bundler): `bundle exec jekyll serve --config _config.yml,_config_dev.yml` or add `--livereload`
5. Visit:
   - `http://localhost:4000`

If `bundle install` fails with **permission errors** writing under `/opt/homebrew/...` (common with Homebrew Ruby), this repo sets `BUNDLE_PATH` to `vendor/bundle` via `.bundle/config`, so gems install inside the project and do not need system paths. Run `bundle install` again from the repo root; `vendor/bundle/` is gitignored.

**Production (GitHub Pages):** The workflow `.github/workflows/deploy-pages.yml` runs after **Scheduled publish notes** completes (or on manual dispatch). It runs `ruby scripts/asset_hashes.rb` and `ruby scripts/generate_tag_pages.rb` before the Jekyll build (GitHub Pages does not run custom plugins). Enable in the repo: **Settings → Pages → Build and deployment → Source: GitHub Actions**. Locally, the tag plugin generates tag pages when you run `jekyll serve` (with `--config _config.yml,_config_dev.yml` as above); if you skip the asset script, the layout falls back to `styles.css` and `notes/notes.css`.

## Hosting

This site is hosted on GitHub Pages using the custom domain configured in the `CNAME` file.

## Getting Started

Run a local preview (see Build and Preview above) or visit the live site at [codewithavinash.com](https://codewithavinash.com).

## License

© 2026 Avinash Arora. All rights reserved.
