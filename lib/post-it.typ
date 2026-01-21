#import "@preview/valkyrie:0.2.2" as z

#let base-colors-schema = z.dictionary((
  bgcolor1: z.color(),
  bgcolor2: z.color(),
  textcolor1: z.color(),
  textcolor2: z.color(),
))

#let default-base-colors = (
  bgcolor1: black,
  bgcolor2: black,
  textcolor1: white,
  textcolor2: white,
)

#let poster_section(
  title,
  body,
  base-colors: default-base-colors,
  fill: false,
) = {
  set par(first-line-indent: 0em)
  let fill_color = if fill { base-colors.bgcolor1 } else { none }
  block(
    width: 100%,
    fill: fill_color,
    inset: 20pt,
    radius: 10pt,
    stack(
      align(center)[#text(fill: rgb("#144a35"), title)],
      v(0.4em),
      line(
        length: 100%,
        stroke: (
          paint: base-colors.bgcolor2,
          thickness: 2pt,
          cap: "round",
        ),
      ),
      v(0.6em),
      [#body],
      v(0.3em),
    ),
  )
}

#let poster_header(
  title,
  author,
  mentor,
  subtitle,
  logo,
  base-colors,
) = {
  let logo-content = {
    if logo != none {
      align(center + horizon)[#logo]
    } else {
      []
    }
  }
  let authors-content = {
    if mentor != none {
      [#author --- #mentor]
    } else {
      [#author]
    }
  }

  set text(
    fill: base-colors.textcolor2,
  )
  stack(
    dir: ttb,
    block(
      fill: base-colors.bgcolor2,
      width: 100%,
      height: 100%,
      inset: 0.4in,
      grid(
        columns: (1fr, 4fr, 1fr),
        [],
        align(center + horizon)[#stack(
          spacing: 0.2in,
          text(size: 14pt, weight: "extrabold")[#title],
          text(size: 13pt)[#authors-content],
          text(size: 12pt)[#subtitle],
        )],
        logo-content,
      ),
    ),
  )
}


#let poster_footer(base-colors) = {
  stack(
    dir: ttb,
    block(
      fill: base-colors.bgcolor2,
      width: 100%,
      height: 100%,
    ),
  )
}

#let base-colors = (
  bgcolor1: rgb("#E3F6E4"),
  bgcolor2: rgb("#144a35"),
  textcolor1: rgb("#2f0707"),
  textcolor2: rgb("#ffffff"),
)

#let acolor = rgb("#583b29")

#let ccolor0 = rgb("#5D4C6D")
#let ccolor1 = rgb("#9E1758")
#let ccolor2 = rgb("#0A5053")
#let ccolor3 = rgb("#8B5407")

#let ccolor4 = rgb("#7E3263")
#let ccolor5 = rgb("#543456")
#let ccolor6 = rgb("#4B522D")
#let ccolor7 = rgb("#74503A")

#let cfill = rgb("#97B6A1")

#let interp0 = rgb("#703661")
#let interp1 = rgb("#613A5F")
#let interp2 = rgb("#44415B")
#let interp3 = rgb("#274957")
#let interp4 = ccolor2

#let colored_poster_section = poster_section.with(base-colors: base-colors)

#let poster(
  title: "",
  author: "",
  width: 8.27in,
  height: 11.69in,
  // width: 210mm,
  // height: 297mm,
  base-colors: base-colors,
  mentor: none,
  subtitle: none,
  logo: none,
  doc,
) = {
  // validation
  assert(base-colors != none, message: "Must provide base-colors to post-it")
  base-colors = z.parse(base-colors, base-colors-schema)

  set page(
    // paper: "a4",
    height: height,
    width: width,
    margin: 0in,
    header: none,
    footer: none
  )

  set par(justify: true)

  set text(
    size: 11pt,
    fill: base-colors.textcolor1,
  )

  show heading.where(level: 2): it => [
    #set text(40pt, fill: base-colors.bgcolor2)
    #it
    #v(0.3em)
  ]

  show strong: it => [
    #set text(fill: base-colors.textcolor1)
    #it
  ]

  grid(
    columns: 1,
    rows: (13%, 83%, 4%),
    poster_header(
      title,
      author,
      mentor,
      subtitle,
      logo,
      base-colors,
    ),
    doc,
    poster_footer(base-colors),
  )
}
