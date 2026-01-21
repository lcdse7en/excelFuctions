// Utility to highlight TODOs to easily find them in the PDF
#let TODO(body, color: yellow, title: "TODO") = {
  rect(
    width: 100%,
    radius: 3pt,
    stroke: 0.5pt,
    fill: color,
  )[
    #text(weight: 700)[#title]: #body
  ]
}

// ========================= box:1 ============================
// e.g #breakoutbox("showe")[#lorem(133)]
#let breakoutbox(title, contents) = [
  #set par(first-line-indent: 0em, spacing: 0.6em)
  #box(
    inset: 10pt,
    width: 100%,
    stroke: (top: 2pt, bottom: 2pt),
    fill: rgb("#ddeedd"),
  )[
    #if title.len() > 0 {
      // align(left, smallcaps[*#title*])
      align(left, [*#title*])
    }

    #align(left)[#contents]
  ]
]

// ========================= box:2 ============================
#let darkred = rgb("#540808")
#let darkyellow = rgb("#fcba03")
#let bonus(i) = {
  let b = ""
  if i >= 10 {
    b = "+"
  }
  b + str(int((i - 10) / 2))
}

#let stat-to-str(a) = {
  (str(a) + " (" + bonus(int(a)) + ")")
}
#let stats-table(stats) = {
  let content = ()
  for k in stats.keys() {
    content.push([#text(fill: darkred, weight: 700, k)])
  }
  for k in stats.values() {
    content.push([#text(fill: black, stat-to-str(k))])
  }
  table(stroke: none, columns: (
      1fr,
      1fr,
      1fr,
      1fr,
      1fr,
      1fr,
    ), inset: 0pt, row-gutter: 5pt, align: center, ..content)
}
#let boxed-text(header, contents) = [
  #box(
    inset: 10pt,
    fill: rgb("#fefff9"),
    stroke: (right: 1pt + darkyellow, left: 1pt + darkyellow),
    width: 100%,
  )[
    #set par(spacing: .6em, first-line-indent: 1.5em)
    #set text(size: 10pt)
    #heading(outlined: false, level: 3, header)
    #v(0.5em)
    #contents
  ]
]
#let statbox(stats) = [
  #box(inset: 12pt, fill: white, stroke: 1pt, width: 100%)[
    #set par(first-line-indent: 0em, spacing: .6em)
    #set text(size: 10pt)
    #heading(outlined: false, level: 3, stats.name)

    _ #stats.description _

    #line(stroke: 2pt + darkred, length: 100%)
    #text(fill: darkred)[*Armor Class*] #stats.ac\
    #text(fill: darkred)[*Hit Points*] #stats.hp\
    #text(fill: darkred)[*Speed*] #stats.speed\

    #line(stroke: 2pt + darkred, length: 100%)
    #stats-table(stats.stats)
    #line(stroke: 2pt + darkred, length: 100%)

    #for skill in stats.skillblock {
      [#text(fill: darkred)[*#skill.at(0)*] #skill.at(1)\ ]
    }
    #line(stroke: 2pt + darkred, length: 100%)
    #for trait in stats.traits {
      [ _*#trait.at(0).*_ #trait.at(1)]
    }

    #let sections = (
      "Actions",
      "Reactions",
      "Limited Usage",
      "Equipment",
      "Legendary Actions",
    )

    #for section in sections {
      if section in stats.keys() {
        block[
          #set par(spacing: 1em)
          #text(size: 1.3em, fill: darkred)[#box(
            width: 100%,
            inset: (bottom: 3pt),
            stroke: (bottom: 1pt + darkyellow),
          )[#smallcaps(section)]]
          #for action in stats.at(section) {
            [_*#action.at(0).*_ #action.at(1) \ ]
          }
        ]
      }
    }
  ]
]

// ========================= box:3 ============================
#let base-fill-color = rgb("#F2F2F2")
#let base-stroke-color = rgb("#828282")
#let base-text-color = rgb("#333333")

#let badge-colors = (
  gray: (
    bg: rgb("#f9fafb"),
    border: rgb("#ebedee"),
    text: rgb("#4b5563"),
  ),
  red: (
    bg: rgb("#fef2f2"),
    border: rgb("#fcdedd"),
    text: rgb("#b91c1b"),
  ),
  yellow: (
    bg: rgb("#fefce8"),
    border: rgb("#f5e5c1"),
    text: rgb("#854d0f"),
  ),
  green: (
    bg: rgb("#effdf4"),
    border: rgb("#cbebd3"),
    text: rgb("#17803d"),
  ),
  blue: (
    bg: rgb("#eff6ff"),
    border: rgb("#dae5fb"),
    text: rgb("#1c4ed8"),
  ),
  purple: (
    bg: rgb("#faf5ff"),
    border: rgb("#efdffa"),
    text: rgb("#7e22ce"),
  ),
)

#let ui-action(content) = box(
  radius: 2pt,
  inset: 2pt,
  fill: base-fill-color,
  stroke: base-stroke-color,
  width: auto,
  height: auto,
  content,
)

#let badge(
  content,
  fill: base-fill-color,
  stroke: base-stroke-color,
  text-color: base-text-color,
) = box(
  radius: 2pt,
  inset: 2pt,
  fill: fill,
  stroke: stroke,
  width: auto,
  height: auto,
  baseline: 2pt,

  if type(content) == str {
    text(fill: text-color, content)
  } else {
    content
  },
)

#let badge-gray(content) = badge(
  content,
  fill: badge-colors.gray.bg,
  stroke: badge-colors.gray.border,
  text-color: badge-colors.gray.text,
)
#let badge-red(content) = badge(
  content,
  fill: badge-colors.red.bg,
  stroke: badge-colors.red.border,
  text-color: badge-colors.red.text,
)
#let badge-yellow(content) = badge(
  content,
  fill: badge-colors.yellow.bg,
  stroke: badge-colors.yellow.border,
  text-color: badge-colors.yellow.text,
)
#let badge-green(content) = badge(
  content,
  fill: badge-colors.green.bg,
  stroke: badge-colors.green.border,
  text-color: badge-colors.green.text,
)
#let badge-blue(content) = badge(
  content,
  fill: badge-colors.blue.bg,
  stroke: badge-colors.blue.border,
  text-color: badge-colors.blue.text,
)
#let badge-purple(content) = badge(
  content,
  fill: badge-colors.purple.bg,
  stroke: badge-colors.purple.border,
  text-color: badge-colors.purple.text,
)

// ========================= box:4 ============================
#let checkbox = {
  set text(size: 12.5pt, baseline: -0.1pt)
  box(
    grid(
      gutter: -8pt,
      $square$,
      $checkmark$,
    ),
  )
}
