
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Jesus Omar Lacruz"
#let locale-catalog-page-numbering-style = context { "Jesus Omar Lacruz - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Nov 2026"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-partial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-small-caps-for-name = false
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-nested-bullet = "-"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-nested-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let bullet-entry(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: 0pt,
    indent: 0pt,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #if design-header-small-caps-for-name [
    #smallcaps(it.body)
  ] else [
    #it.body
  ]
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-partial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Jesus Omar Lacruz

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Madrid, Spain],
  [#box(original-link("https://github.com/jesusomarlacruz")[#fa-icon("github", size: 0.9em) #h(0.05cm)jesusomarlacruz])],
)
#connections(connections-list)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
    #strong[Universitat Politècnica de València], Electronic Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Thesis: Low-complexity algorithms and hardware architectures for Non-Binary LDPC decoders, achieving Giga-rate decoding with high throughput\/area efficiency.],)
  ],
  right-content: [
    Valencia, Spain

Sept 2013 – Oct 2016
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
    #strong[Universitat Politècnica de València], Electronic Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([FPGA implementation of DSP and digital communication blocks; system-on-chip architectures; synthesis and verification using VHDL \/ Verilog.],)
  ],
  right-content: [
    Valencia, Spain

Sept 2011 – July 2013
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
    #strong[Universidad de Los Andes], Electrical Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Analog and digital electronics; communication systems; digital signal processing.],)
  ],
  right-content: [
    Mérida, Venezuela

Mar 2003 – Sept 2009
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[IMDEA Networks Institute], Senior Researcher \(Full-time\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Leading the Wireless Networks on SoCs Group, in charge of the design and development of high-speed signal processing architectures for millimeter-wave \(mm-wave\) communication systems.],[Supervision of Ph.D. students.],[PI \/ co-PI of regional, national, and European projects.],)
  ],
  right-content: [
    Madrid, Spain

July 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IMDEA Networks Institute], Research Engineer \(Full-time\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Leading the design and development of FPGA-based experimentation platforms for multi-Giga-sampling-rate SISO and MIMO mm-wave communication systems.],[Signal processing blocks for 5G-NR and WLAN mm-wave systems.],[Co-supervising Ph.D. students in the Wireless Networking Group.],)
  ],
  right-content: [
    Madrid, Spain

Oct 2017 – July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Universidad de Los Andes], Full-time Professor
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Full-time professor with the Electronic \/ Communications Department.],[Teaching: Analog \/ Digital Electronics; Foundations of Communication Systems; Basics of Digital Signal Processing \(undergraduate and Master's level\).],[Supervising Final Degree Projects.],)
  ],
  right-content: [
    Mérida, Venezuela

Mar 2010 – Oct 2017
  ],
)



== Awards


#two-col-entry(
  left-content: [
    #strong[Best Demo Award \(Runner-Up\)]

  ],
  right-content: [
    2026
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Jesus Omar Lacruz])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Best Paper Award \(Runner-Up\)]

  ],
  right-content: [
    2020
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Jesus Omar Lacruz])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Best Paper Award]

  ],
  right-content: [
    2020
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Jesus Omar Lacruz])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Positive Evaluation -- Titular de Universidad]

  ],
  right-content: [
    Dec 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Jesus Omar Lacruz])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Positive Evaluation -- Doctor Contratado]

  ],
  right-content: [
    June 2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Jesus Omar Lacruz])



== Projects


#two-col-entry(
  left-content: [
    #strong[IoT-ZERO \(PI\)]
  ],
  right-content: [
    2026 – 2029
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [European Union -- HORIZON-JU-SNS-2024, grant 101292662.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PRIME-6G \(Co-PI\)]
  ],
  right-content: [
    2026 – 2029
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [European Union -- HORIZON-JU-SNS-2024, grant 101272485.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[DISCO6-CM \(PI\)]
  ],
  right-content: [
    2025 – 2027
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Comunidad de Madrid, TEC-2024COM-360.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[MultiX \(Co-PI\)]
  ],
  right-content: [
    2025 – 2027
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [European Union -- HORIZON-JU-SNS-2024, grant 101119521.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[6th Sense \(Co-supervisor\)]
  ],
  right-content: [
    2024 – 2028
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [European Union -- MSCA Doctoral Network, grant 101119652. Co-supervisor of 1 Ph.D. student; low-power ISAC architectures.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[6G-ELSA \(Research team\)]
  ],
  right-content: [
    2023 – 2026
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Ministerio de Ciencia e Innovación. Passive, multiband sensing mechanisms.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[RISC-6G \(Research team\)]
  ],
  right-content: [
    2022 – 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Spanish Government \/ EU NextGenerationEU, TSI-063000-2021-59. Integration of low-power communication and sensing modules into 6G experimental platforms.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[MINTS \(Research team, co-supervisor\)]
  ],
  right-content: [
    2019 – 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [European Union -- H2020 MSCA-ITN-2019, grant 861222. Co-supervisor of 1 Ph.D. student; mm-wave beam training and interference management.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[LOCUS \(Research team\)]
  ],
  right-content: [
    2019 – 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [European Union -- H2020-ICT-2019-2, grant 871249. Active localization techniques on mm-wave and sub-6 GHz platforms.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[REACT-CONTACT \(Research team\)]
  ],
  right-content: [
    2020 – 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Comunidad de Madrid, CM-23479. Human-activity estimation algorithms for ISAC systems.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PinPoint 5G+ \(Research team\)]
  ],
  right-content: [
    2019 – 2020
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Ministerio de Ciencia, Innovación y Universidades, RTI2018-094313-B-I00. Localization systems for 5G platforms.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[SEARCHLIGHT \(Research team\)]
  ],
  right-content: [
    2014 – 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [ERC Consolidator Grant, ERC-CG-2013-PE7, grant 617721. mm-wave experimentation platforms.])], column-gutter: 0cm)
  ],
)



== Service



#one-col-entry(
  content: [
    #strong[IEEE Globecom 2026 Workshop -- Sensing-Native Radio Access Networks for 6G], TPC Co-chair

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[IEEE International Workshop on Signal Processing Systems 2026], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[2026 IEEE 1st Annual Integrated Sensing and Communication Conference \(ISAC\), SS06], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[ACM SenSys 2026 \(Poster Session\)], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[2026 EuCNC & 6G Summit], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[IEEE VTC2024-Fall], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[IEEE VTC2024-Spring], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[IEEE WiSense Workshop, 2024-2026], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[ACM mmWaveSys 2023], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[ACM Emerging Wireless 2022], TPC Member

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Journal Reviewer], Ad hoc reviewer

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([IEEE Transactions on Circuits and Systems I, IEEE Transactions on Circuits and Systems II, IEEE Transactions on VLSI Systems, IEEE Transactions on Networking, IEEE Transactions on Mobile Computing, IEEE Transactions on Wireless Communications, IEEE Communications Magazine, IEEE Journal on Selected Areas in Communications, Elsevier Computer Communications.],)
  ],
)



