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
   `https://api.crossref.org/works?query.bibliographic=<title>` -- never guess one). For an
   award-winning paper, set **both** `award` and `award_name` to the same award text (not
   `award = {true}` -- the `award` field also feeds the page's hidden print-only award block, so
   a literal `true` would show up when printing/exporting the page).
4. Optional: a PDF in `assets/pdf/` referenced via `pdf = {filename.pdf}`.
5. The Publications page sorts entries newest-to-oldest via `sort_by`/`order` in `_config.yml`'s
   `scholar:` block (`year`, then `month` where set, then author name as a deterministic
   tiebreaker). Add a verified `month` to a new entry when you have one -- most `@inproceedings`
   entries don't have one (no conference month was verified; see TODO.md), so they currently sort
   after dated entries in the same year, ordered alphabetically by first author.

## Add/update a venue's society / quartile / CORE rank

[`_data/venues.yml`](_data/venues.yml) is keyed by the same `abbr` value used in
`_bibliography/papers.bib`. Each entry can set `society` (IEEE, ACM, USENIX, Elsevier,
Springer, ...), and for a journal/magazine `quartile` (Scimago's SJR Best Quartile for that
venue -- look it up at scimagojr.com, use the most recent year available) or for a
conference `rank` (CORE/ICORE rank -- look it up at portal.core.edu.au/conf-ranks, use the
most recent ranking round). **Only add a quartile/rank you've actually verified on the real
site for the current year/round** -- omit the field entirely rather than guess or carry
forward a stale one; see TODO.md "Venue metadata" for venues where this was deliberately
left blank and why. Rendered as a second badge under the venue abbreviation by the local
override [`_layouts/bib.liquid`](_layouts/bib.liquid) (tracked in `.al-folio-overrides.yml`,
run `bundle exec al-folio upgrade overrides diff _layouts/bib.liquid` after a gem update),
styled by the `.venue-meta` block in `_sass/_publications.scss`.

## Publications page: Journal/Conference filter buttons

[`_pages/publications.md`](_pages/publications.md) has three buttons (`data-pub-filter="all |
journal | conference"`) alongside the existing text search box. They're handled by the local
override [`assets/js/bibsearch.js`](assets/js/bibsearch.js) (shadows al_folio_core's own copy --
tracked in `.al-folio-overrides.yml`, run `bundle exec al-folio upgrade overrides diff
assets/js/bibsearch.js` after a gem update), which narrows the same `.unloaded` class the text
search already uses, based on each entry's `pub_type` badge (`journal` matches `Journal` +
`Magazine`; `conference` matches `Conference` + `Demo`; `Patent` isn't included in either). Button
styling is in the `.pub-type-filter` block of `_sass/_publications.scss` (also a local override).
To add a third bucket (e.g. a dedicated Patents button), add another `data-pub-filter` button and
extend `typeFilterGroups` in `bibsearch.js`.

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

Teaching, TPC roles, and Ph.D. supervision are all plain Markdown in the body of
[`_pages/teaching.md`](_pages/teaching.md) (the "Service & Teaching" nav page, at
`/service-teaching/`) -- edit it directly. (There's no `_teachings` collection in use; course
names are folded into the "Full-time Professor" paragraph as plain text.)

Journal reviewing is intentionally **not** shown on this page -- it's kept only in
[`_data/cv.yml`](_data/cv.yml)'s `Service` section (the `Journal Reviewer` entry), so it still
appears on the generated CV PDF without being listed on the website.

## Re-enabled-if-you-want-them pages

`_pages/blog.md`, `_pages/repositories.md`, `_pages/profiles.md`, and `_pages/dropdown.md`
are shipped with the template but set to `nav: false` because they weren't part of the
requested page set. Flip `nav: true` (and fill in the matching `_data/*.yml` file) to bring
any of them back.
