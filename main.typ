#import "@local/se7en-typst-book:0.1.0": *
#import "chapters/abbreviations.typ": abbreviations

#show: se7en-typst-book.with(
  paper-size: "a4",
  title: "FUCTIONS",
  author: "Park Se7en",
  author-kr: "양창등",
  subject: "EXCEL",
  semester: "Se7en",
  date: auto,
  abstract: include "./chapters/abstract.typ",
  maketitle: true,
  makeoutline: true,
  outline-depth: 3,
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
  equation-index: (enabled: true),
  theorem-index: (enabled: true),
  // definition-index: (enabled: true),
  example-index: (enabled: true),
  appendix-path: include "./chapters/appendix.typ",
  bibliography-path: "references.bib",
  bibliography-title: "参考文献",
  bibliography-full: false,
  bibliography-style: "gb-7714-2015-note",
  // theme: "dark",
  media: "print", // 可选值为 "screen" 或 "print"
  typst-version: "0.14.2",
  covers: (
    firstname: "Park",
    lastname: "Se7en",
    email: "seenliang969@gmail.com",
    // homepage: "https://github.com/lcdse7en/config.typst.exam",
    phone: "(+86) 193-1808-6953",
    // website: "set",
    github: "lcdse7en",
    twitter: "typstapp",
    scholar: "",
    // orcid: "0000-0000-0000-000X",
    linkedin: "Example",
    address: "深圳，广东",
    custom: (
      (
        text: "config.typst.book",
        icon: "home",
        link: "https://github.com/lcdse7en/config.typst.book",
      ),
      (
        text: "Youtube Channel",
        icon: "youtube",
        link: "https://example.com",
      ),
      (
        text: "2353442022@qq.com",
        icon: "qq",
      ),
      (
        text: "lcdse7en",
        icon: "weixin",
      ),
      (
        text: "typst.account",
        icon: "globe",
        link: "https://github.com/lcdse7en/typst.account",
      ),
    ),
  ),
)

#let chapters = (
  "./chapters/数字函数.typ",
  "./chapters/财务函数.typ",
)

#for (i, chapter) in chapters.enumerate() {
  include (chapter)
  pagebreak()
}
