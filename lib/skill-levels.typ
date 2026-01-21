#let skill-levels(skills) = context {
  block(
    inset: (x: 1pt),
    grid(
      columns: (auto, 1fr, auto),
      rows: auto,
      gutter: 0.5em,
      align: (horizon + center, horizon, horizon),
      ..skills
        .map(skill => {
          (
            {
              set image(width: 12pt)
              // Example flag icons from https://github.com/gosquared/flags/tree/master/flags/flags-iso/shiny/64 (under MIT license)
              skill.icon
            },
            skill.text,
            box(
              fill: rgb("#414cc8").transparentize(80%),
              width: 50pt,
              height: 6pt,
            )[
              #rect(
                width: skill.level,
                height: 100%,
                fill: rgb("#414cc8"),
              )
              #place(
                top + left,
                rect(
                  width: 100%,
                  height: 100%,
                  fill: gradient.linear(
                    rgb("#fefcfc").transparentize(100%),
                    rgb("#fefcfc").transparentize(70%),
                  ),
                ),
              )
            ],
          )
        })
        .flatten()
    ),
  )
}
