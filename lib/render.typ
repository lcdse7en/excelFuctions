#let crop = (img_bytes, start: (0.0%, 0.0%), resize: 100%) => context {
  assert(resize <= 100%)
  let img = image(img_bytes)
  // Get dimensions of the source image
  let dims = measure(img)
  layout(size => {
    let (left, top) = start

    let image_height_ratio = float(100% - top) * float(resize)
    let image_width_ratio = float(100% - left) * float(resize)

    let layout-aspect-ratio = size.height / size.width
    let image-aspect-ratio = (
      (dims.height * image_height_ratio) / (dims.width * image_width_ratio)
    )
    let image_layout_ratio = if layout-aspect-ratio >= image-aspect-ratio {
      dims.height * image_height_ratio / size.height
    } else {
      dims.width * image_width_ratio / size.width
    }

    let top_clip = top * dims.height / image_layout_ratio

    box(
      clip: true,
      inset: (
        top: -top * dims.height / image_layout_ratio,
        bottom: -(1 - image_height_ratio - float(top))
          * dims.height
          / image_layout_ratio,
        left: -left * dims.width / image_layout_ratio,
        right: -(1 - image_width_ratio - float(left))
          * dims.width
          / image_layout_ratio,
      ),
      image(
        img_bytes,
        height: dims.height / image_layout_ratio,
        width: dims.width / image_layout_ratio,
      ),
    )
  })
}

#let page_size_dict = (
  "a0": (841mm, 1189mm),
  "a1": (594mm, 841mm),
  "a2": (420mm, 594mm),
  "a3": (297mm, 420mm),
  "a4": (210mm, 297mm),
  "a5": (148mm, 210mm),
  "a6": (105mm, 148mm),
  "a7": (74mm, 105mm),
  "a8": (52mm, 74mm),
  "a9": (37mm, 52mm),
  "a10": (26mm, 37mm),
  "a11": (18mm, 26mm),
)

#let get_size(size, flipped: bool) = {
  let s = if type(size) == str {
    page_size_dict.at(lower(size))
  } else {
    size
  }
  return if flipped { (s.at(1), s.at(0)) } else { s }
}

// config theme
#let extend_bottom(size: (0, 0), img: image, bottom: [], ratio: fraction) = {
  rect(width: size.at(0), height: size.at(1), inset: 0mm, outset: 0mm)[
    #grid(
      rows: (90fr, ratio),
      fill: rgb("#ffffff"),
      inset: 0mm,
      img,
      bottom,
    )
  ]
}

#let extend_right(size: (0, 0), img: image, right: [], ratio: fraction) = {
  rect(width: size.at(0), height: size.at(1), inset: 0mm, outset: 0mm)[
    #grid(
      columns: (90fr, ratio),
      fill: rgb("#ffffff"),
      inset: 0mm,
      img, right,
    )
  ]
}

// theme1
#let theme1(size: (), img: image, ext_info: (:)) = {
  let logo = ext_info.at("logo", default: [])
  let title = ext_info.at("title", default: [])
  let date = ext_info.at("date", default: [])
  let address = ext_info.at("address", default: [])

  let bottom = grid(
    columns: (20fr, 2fr, 60fr, 2fr, 20fr),
    inset: 2pt,
    gutter: 0pt,
    logo,
    align: center + horizon,
    line(stroke: 2pt + gray, length: size.at(1) * 0.08, angle: 90deg),
    title,
    line(stroke: 2pt + gray, length: size.at(1) * 0.08, angle: 90deg),
    [#address #date],
  )
  extend_bottom(size: size, img: img, bottom: bottom, ratio: 10fr)
}

// theme2
#let theme2(size: (), img: image, ext_info: (:)) = {
  let logo = ext_info.at("logo", default: [])
  let title = ext_info.at("title", default: [])
  let date = ext_info.at("date", default: [])
  let address = ext_info.at("address", default: [])

  let bottom = grid(
    rows: (10fr, 2fr, 60fr, 2fr, 20fr),
    inset: 2pt,
    gutter: 0pt,
    logo,
    align: center + horizon,
    line(stroke: 2pt + gray, length: size.at(0) * 0.08, angle: 0deg),
    title,
    line(stroke: 2pt + gray, length: size.at(0) * 0.08, angle: 0deg),
    [#address\ #date],
  )
  extend_right(size: size, img: img, right: bottom, ratio: 10fr)
}

// main
#let render(size, flipped: false, img: image, theme: str, ext_info: (:)) = {
  let size = get_size(size, flipped: flipped)
  if theme == "theme1" {
    theme1(size: size, img: img, ext_info: ext_info)
  } else if theme == "theme2" {
    theme2(size: size, img: img, ext_info: ext_info)
  } else {
    panic("Theme [" + theme + "] is not existed")
  }
}
