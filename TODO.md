# TODO

Placeholders and unverified items left for you to fill in or confirm.

## Group page (`_pages/group.md`)

No photos for anyone in the team table (none were supplied, and I'm not going to guess
at stock images for real people) -- it's a text-only team table for now. The vision
paragraph is my synthesis of the group's actual platform/publication output, not
something you dictated -- read it over and adjust the wording/emphasis if it doesn't
match how you'd describe the group's direction yourself.

## Identity / contact (`_data/socials.yml`)

- **ORCID** -- done: `orcid_id: 0000-0002-6641-2003`.
- **Email** -- the `email:` key is commented out entirely (not just blank) so no
  non-functional mail icon shows up. Decide between the IMDEA and personal address,
  uncomment the line, and fill it in -- `protect_email: true` is already set in
  `_config.yml` so it will be obfuscated once there's a real address.
- **Google Scholar user ID** -- `scholar_userid:` is blank.
- **dblp** -- `dblp_url:` is blank.
- **LinkedIn** -- `linkedin_username:` is blank.
- Removed from the social icon row on request: the RSS icon, the (empty) `work_url`
  briefcase icon, and the duplicate "IMDEA Networks WNG" GitHub icon (the org's GitHub
  is still linked from the About page body text and from each Platforms card).

## CV PDF

`_pages/cv.md` and `_data/socials.yml` point `cv_pdf` at
`/assets/rendercv/rendercv_output/Jesus_Omar_Lacruz_CV.pdf`, which
`.github/workflows/render-cv.yml` should generate from `_data/cv.yml` on push to `main`. **This
filename is my best guess based on the RenderCV naming convention (name with underscores +
"\_CV.pdf") -- I have not seen the workflow actually run.** After the first push, check the
Action's run and the generated path under `assets/rendercv/rendercv_output/`, and fix the
`cv_pdf:` value in both files if the real filename differs.

## News -- all dates are now real and verified

Every remaining news item has a verified date (no more invented placeholders): the MobiSys
2026 demo award and the HELIX/MobiSys 2025 item use the official conference start dates
(sigmobile.org), and the IEEE Communications Letters item uses IEEE Xplore's "Date of
Publication" (01 Jun 2026). The Globecom TPC item, and the IoT-ZERO/PRIME-6G and DISCO6-CM
project-start items, were **removed** rather than dated with a guess, since the CV only gives
a bare year for those and no public, verifiable date exists. Let me know the real dates if you
want any of them back.

## Platforms page

- **mm-FLEX**: no public GitHub repository was found under `IMDEANetworksWNG` or
  `jesusomarlacruz` (checked both org and personal account listings), so there's still no
  code/GitHub link on that card. If a repo exists elsewhere, send me the URL. Its card image
  (`assets/img/platforms/mmflex.png`) is now Fig. 1 from the "High-Speed Millimeter-Wave
  Mobile Experimentation on Software-Defined Radios" GetMobile piece you supplied.
- **MIMORPH**'s card image (`assets/img/platforms/mimorph.png`) is now a real hardware photo
  -- Fig. 3 (left half) from the MIMORPH GetMobile piece you supplied, cropped to drop the
  throughput graph on the right. HELIX and MISO use real hardware photos from their own repos
  (`figures/eval_setup.png`, `Figures/Experimentation.jpg`).
- The two source PDFs you attached (`3457356.3457368.pdf`, `3539668.3539670.pdf`) were only
  used locally to crop those two images -- they are not part of the repo.
- Removed on request (not an oversight): the MIMORPH_ZCU208 card, and all four "group tool"
  cards (UbiLocate, MultiLoc, Mikrotik-researcher-tools, MikroTik-mD-Track) since you're not
  part of those projects.
- `_data/venues.yml` was not populated, so the venue badges (TWC, MobiSys, ISCAS, ...) on the
  Publications page aren't clickable links yet. Optional enhancement -- see "Adding a new
  publication" in `docs/CUSTOMIZE.md`.
- `_data/coauthors.yml` was not populated either, so co-author names aren't auto-linked to
  their own pages. Optional enhancement.

## Projects page

The Technology Transfer table was removed on request. The 5 industry contracts/license
agreements it listed (Huawei x2, TU Darmstadt x2, H2020 ORCA/MISO) are no longer published
anywhere on the site -- say the word if you want them back in some form.

## Service & Teaching: Ph.D. supervision

Simplified on request to a plain bullet list (no project/period attribution per student,
since that's where the mix-ups were): Sai Pavam Deram, Amir Hossein Mohammad Amri, and
Rafael Ruiz Ortiz.

## CV page removed from navigation

`_pages/cv.md` was set to `nav: false` on request -- it's no longer linked from the navbar,
but the page and `_data/cv.yml` still exist if you want it back later (just flip `nav: true`).
The `render-cv.yml` GitHub Action still renders a PDF from `cv.yml` on push regardless.

## Bibliography (`_bibliography/papers.bib`)

All 39 entries from the CV are included. Two intentionally have **no DOI** because none
exists for them (verified via Crossref -- not guessed):

- `madani2021practical` (USENIX NSDI 2021) -- USENIX doesn't register DOIs; linked to the
  official conference page instead (`https://www.usenix.org/conference/nsdi21/presentation/madani`).
- `pegoraro2023patent` -- patents aren't DOI-registered; linked to Google Patents instead
  (`https://patents.google.com/patent/WO2023214252A1/en`), verified against the title and
  inventor list.

Every other DOI was checked against the Crossref API (title + venue + year, and in two cases
the exact page range) before being added -- see the git history of this file / my summary to
you for the one-off corrections (Elsevier typo, Aug. month typo, Català/Jiménez/García/Pérez/
Ramírez accents, and the two inconsistent GetMobile years).

## Profile photo

`assets/img/prof_pic.jpg` was downloaded from the GitHub avatar URL you gave
(`https://avatars.githubusercontent.com/u/76119982`, verified to be `jesusomarlacruz`'s own
avatar) since no photo file was in the CV folder. Swap it for a real photo whenever you like.

## Hidden-but-not-deleted template pages

`_pages/blog.md`, `_pages/repositories.md`, `_pages/profiles.md`, and `_pages/dropdown.md`
(plus the demo `_posts`, `_books`, and old `_projects`/`_teachings`/`_news` content, which were
deleted outright) are set to `nav: false` rather than removed, in case you want a blog,
GitHub-stats page, or lab-members page later. See the note at the end of `MAINTENANCE.md`.

## One-time manual GitHub steps (after the first push)

These are account/repo settings I'm deliberately not changing myself -- please do them once,
following `docs/INSTALL.md`:

1. Repo Settings -> Actions -> General -> Workflow permissions -> set to "Read and write
   permissions" (needed for the deploy workflow to push to `gh-pages`).
2. After the first successful Actions run, Settings -> Pages -> Source -> set to the
   `gh-pages` branch.

## Minor / non-blocking

- Local build on this Windows machine needed a one-off `convert` shim (ImageMagick 7 doesn't
  ship a `convert.exe` on Windows, and Windows' own `System32\convert.exe` -- a filesystem
  converter -- would otherwise shadow it) and a relocated Bundler gem cache (`C:/rbbundle`
  instead of `vendor/bundle`, because this repo's OneDrive path is long enough that a
  git-sourced gem's pack files hit Windows' path-length limit). Neither is committed to the
  repo and neither affects GitHub Actions (Ubuntu), which builds normally.
- A handful of JS files fail Terser minification locally ("SyntaxError") during
  `jekyll build`/`serve` but don't stop the build; this looks environment-related (Windows
  Node/terser) rather than caused by anything in this site's own content, since it touches
  `test/` files unrelated to my changes. Worth a sanity check against the GitHub Actions log
  after the first push, but not something I'd block on.
