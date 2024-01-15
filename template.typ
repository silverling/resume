#let serif = ("Palatino Linotype", "Noto Serif CJK SC")
#let sans = ("Libertinus Sans", "Noto Sans CJK SC")
#let mono = ("Consolas")
#let rem = 12pt

#let infomation(
  wechat: none,
  email: none,
  phone: none,
  github: none,
  avatar: none,
) = {
  let _title = heading[个人信息]

  let _wechat = text(
    size: rem,
  )[微信：#text(font: mono)[#wechat]]

  let _email = text(
    size: rem,
  )[邮箱：#text(font: mono)[#email]]

  let _phone = text(
    size: rem,
  )[电话：#text(font: mono)[#phone]]

  let _github = text(
    size: rem,
  )[#text(font: sans)[Github]：#text(font: mono)[#github]]

  let _grid = grid(
    columns: (1fr, auto),
    row-gutter: 0.8em,
    _wechat,
    _email,
    _phone,
    _github,
  )
  
  let _stack = stack(
    dir: ttb,
    spacing: 1em,
    _title,
    _grid,
  )

  let _section = grid(
    columns: (75%, 1fr),
    column-gutter: 2em,
    pad(top: 1em, bottom: 1em, _stack),
    place(top + right, dy: -1em, image(avatar)),
  )

  _section
}

#let experience(body, project: none, tag: none) = {
  rect(width: 100%, fill: rgb("#b1f2eb"))[*#project* #h(1fr) #tag]
  pad(x: .5em)[#body]
}

#let resume(
  name-zh: none,
  name-en: none,
  wechat: none,
  email: none,
  phone: none,
  github: none,
  avatar: none,
  doc
) = {

  // == meta ==
  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 10mm),
  )
  set text(lang: "zh", font: serif, size: rem)
  set par(leading: 1em)
  show heading: it => {
    set text(size: 1.5 * rem, weight: "semibold")
    stack(
      spacing: 0.7em,
      it, 
      line(length: 100%),
    )
  }

  // == layout ==

  align(
    bottom,
    heading(
      stack(
        dir: ltr,
        spacing: 1em,
        text(size: 2 * rem, weight: "bold")[#name-zh],
        text(size: 1.5 * rem, weight: "bold")[#name-en]
      )
    )
  )

  infomation(
    wechat: [#wechat],
    email: [#email],
    phone: [#phone],
    github: [#github],
    avatar: avatar,
  )

  doc
}