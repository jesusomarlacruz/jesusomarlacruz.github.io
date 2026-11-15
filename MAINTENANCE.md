# Maintenance

This site is built from a handful of content files. You rarely need to touch the theme
itself -- just edit the files below and push to `main`; GitHub Actions rebuilds and
deploys automatically (see `.github/workflows/deploy.yml`).

Local preview (no Docker on this machine -- see TODO.md for the one-time setup):

```bash
bundle exec jekyll serve
```

## Update the Group page

Edit [`_pages/group.md`](_pages/group.md) directly (the "group" nav page, at `/group/`) --
it's a plain page, not a collection: the vision paragraph and the team table are both
inline Markdown/HTML. Add a row to the table for a new student, or edit the vision text
as the group's direction evolves.

## Add a paper

1. Open [`_bibliography/papers.bib`](_bibliography/papers.bib) and add a new entry (copy an
   existing one of the right type: `@article` for journals/magazines, `@inproceedings` for
   conference/demo papers, `@misc` for a patent).
2. Always set:
   - `abbr` -- short venue tag shown as a badge (e.g. `TWC`, `MobiSys`)
   - `pub_type` -- one of `Journal`, `Magazine`, `Conference`, `Demo`, `Patent` (rendered as a
     second badge by `_includes/hook/bib.liquid`)
   - Author field for yourself as `Lacruz, J. O.` so it gets bolded (matches `scholar:` in
     `_config.yml`)
3. Optional fields: `selected = {true}` (shows it in the About page's selected list), `code =
{https://...}` (adds a Code button, use it when a platform/code repo exists), `doi`/`html`
   (**only add a DOI you've verified resolves to this exact paper** -- e.g. via
   `https://api.crossref.org/works?query.bibliographic=<title>` -- never guess one), `award` /
   `award_name` for award-winning papers.
4. Optional: a PDF in `assets/pdf/` referenced via `pdf = {filename.pdf}`.

## Add a platform card (Platforms page)

Add a file to [`_projects/`](_projects) (copy an existing one, e.g. `_projects/1_helix.md`).
Front matter fields: `title`, `description`, `img` (path under `assets/img/platforms/`, omit
if you don't have one), `importance` (sort order, lower = first), `github` (repo URL, omit if
there isn't one), `related_publications: true`. Cite related papers in the body with
`{% raw %}{% cite bibkey %}{% endraw %}`. This page only lists platforms you're personally
part of -- see TODO.md for group tools that were deliberately left off.

## Add a news item

Add a file to [`_news/`](_news) (copy an existing one). Needs `layout: post`, a `date:`
(full timestamp), `inline: true` to show it directly on the About page. The About page shows
the latest 5 (`announcements.limit` in `_pages/about.md`); the full list is at `/news/`.

## Add a funded project entry

Edit the table directly in [`_pages/funded-projects.md`](_pages/funded-projects.md) (the
"Projects" nav page, at `/projects/`). No funding amounts -- see the privacy note at the top
of that file and in `TODO.md`.

## CV data (currently unlinked from the nav)

[`_data/cv.yml`](_data/cv.yml) (RenderCV-style format) and [`_pages/cv.md`](_pages/cv.md)
are still in the repo -- the CV page was removed from the navbar on request (`nav: false` in
`_pages/cv.md`), not deleted. Edit `cv.yml`'s free-form `sections:` map the same way as
before if you bring the page back; set `nav: true` to re-link it.

## Add/change teaching or service content

Teaching, TPC roles, reviewing, and Ph.D. supervision are all plain Markdown in the body of
[`_pages/teaching.md`](_pages/teaching.md) (the "Service & Teaching" nav page, at
`/service-teaching/`) -- edit it directly. (There's no `_teachings` collection in use; course
names are folded into the "Full-time Professor" paragraph as plain text.)

## Re-enabled-if-you-want-them pages

`_pages/blog.md`, `_pages/repositories.md`, `_pages/profiles.md`, and `_pages/dropdown.md`
are shipped with the template but set to `nav: false` because they weren't part of the
requested page set. Flip `nav: true` (and fill in the matching `_data/*.yml` file) to bring
any of them back.
