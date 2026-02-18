#!/usr/bin/env node
/**
 * Scheduled publish: set is_published to true for notes where publish_at is in the past.
 * All times are interpreted in IST (Indian Standard Time, UTC+5:30).
 * Run from repo root. Uses only Node built-ins (fs, path).
 */

const fs = require("fs");
const path = require("path");

const IST_OFFSET = "+05:30";

/** Parse a date or datetime string as IST; returns a Date or NaN. */
function parseAsIST(str) {
  const s = str.trim().replace(/^["']|["']$/g, "");
  const iso = s.includes(" ")
    ? s.replace(" ", "T") + IST_OFFSET
    : s + "T00:00:00" + IST_OFFSET;
  return new Date(iso);
}

const notesDir = path.join(__dirname, "..", "_notes");
const files = fs.readdirSync(notesDir).filter((f) => f.endsWith(".md") && !f.endsWith(".bak"));

for (const file of files) {
  const filePath = path.join(notesDir, file);
  let content = fs.readFileSync(filePath, "utf8");
  if (!content.startsWith("---")) continue;

  const rest = content.slice(3);
  const idx = rest.indexOf("\n---");
  if (idx === -1) continue;

  const frontmatterStr = rest.slice(0, idx);
  const body = rest.slice(idx + 4);

  const isPublishedMatch = frontmatterStr.match(/^is_published:\s*(.+)$/m);
  const publishAtMatch = frontmatterStr.match(/^publish_at:\s*(.+)$/m);
  if (!publishAtMatch) continue;

  if (isPublishedMatch && isPublishedMatch[1].trim().toLowerCase() === "true") continue;

  const publishAtRaw = publishAtMatch[1].trim();
  const publishTime = parseAsIST(publishAtRaw);
  if (isNaN(publishTime.getTime())) continue;
  if (publishTime > new Date()) continue;

  let newFrontmatter;
  if (isPublishedMatch) {
    newFrontmatter = frontmatterStr.replace(/^is_published:\s*false\s*$/m, "is_published: true");
  } else {
    newFrontmatter = frontmatterStr.trimEnd() + "\nis_published: true\n";
  }
  if (newFrontmatter === frontmatterStr) continue;

  fs.writeFileSync(filePath, "---\n" + newFrontmatter + "\n---\n" + body);
  console.log("Updated:", filePath);
}
