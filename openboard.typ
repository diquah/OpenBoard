#let debug_stroke = 0pt

#let template(paper: "us-letter", doc) = {
  set page(
    paper: paper,
    footer: context {
      if counter(page).get().first() > 1 [
        #h(1fr)
        #set text(font: "Roboto Slab", weight: "semibold", size: 10pt, fill: luma(65%))
        #counter(page).display(
          "1 of 1",
          both: true,
        )
      ]
    },
    margin: (x: 1.2in, y: 0.75in)
  )
  
  set text(font: "STIX Two Text", size: 11.5pt, weight: 400)
  show math.equation: set text(font: "STIX Two Math")
  show strong: set strong(delta: 200)
  doc
}

#let title(title: "", subtitle: "", organization: "", class: "", collect_info: (), exam_version: "") = {
  show par: set block(spacing: 0em)
  set text(font: "Roboto Slab", fill: luma(35%))
  [
    #place(top+right,
      [
        #if collect_info.len() > 0 {
          table(
            columns: (auto, auto),
            fill: (luma(50%), white),
            inset: (x: 0.6em, y: 0.5em),
            stroke: 1.1pt + luma(50%),
            ..for info in collect_info {
              (
                text(size: 10pt, weight: "bold", fill: luma(95%))[#info],
                h(10em)
              )
            }
          )
        }
        #if exam_version.len() > 0 {
          block(stroke: 1.5pt + luma(66%), inset: 0.5em)[#text(size: 16pt, weight: "bold", fill: luma(66%))[#exam_version]]
        }
      ]
    )
    
    *#organization*
    #v(0.75em)
    #class

    #v(7em)
    
    #line(stroke: 5pt + luma(75%), length: 66%)
    #text(size: 22pt, weight: "bold")[#title]
    #v(0.85em)
    #text(size: 15pt, weight: "semibold")[#subtitle]

    #v(7em)
  ]
}

#let instruct(doc) = {
  set text(font: "Roboto Slab", weight: "regular", size: 11pt, fill: luma(40%))
  show heading: set block(spacing: 2em)
  show par: set block(spacing: 2em)
  show list: set list(marker: "—")
  doc
}

#let prompt_counter = counter("prompt_counter")
#let prompt(allow_overrun: false, doc) = {
  prompt_counter.step()
  block(breakable: allow_overrun,
    table(
      columns: (auto, auto),
      stroke: debug_stroke,
      [
        #set text(weight: "black")
        #prompt_counter.display("1.")
      ], [
        #doc
      ]
    )
  )
}

#let custom_prompt(label, doc) = {
  show par: set block(spacing: 2em)
  block(breakable: false, below: 3em,
    table(
      columns: (auto, auto),
      stroke: debug_stroke,
      [
        #set text(weight: "black")
        #label
      ], [
        #doc
      ]
    )
  )
}

#let section_header(head, info: [], reset_question_count: true) = {
  if reset_question_count {
    prompt_counter.update(0)
  }
  line(start: (-2mm, 0%), length: 100% + 2mm, stroke: 2.5pt + luma(50%))
  block(above: 0in, inset: (x: -2mm, y:0in),
    table(
      columns: (auto, auto),
      stroke: 0pt,
      inset: 0pt,
      [
        #block(fill: luma(50%), inset: 3mm, above: 0in,
          text(font: "Roboto Slab", size: 12pt, weight: "black", fill: luma(90%))[#head]
        )
      ],
      [
        #pad(left: 1em, top: 10pt)[
          #set text(font: "Roboto Slab", weight: "regular", size: 11pt, fill: luma(45%))
          #info
        ]
      ]
    )
  )
  v(1em)
}

#let mcq(..options) = {
  block(breakable: false)[
    #table(
      columns: (auto, auto),
      inset: (x: 0.5em, y: 0.666em),
      stroke: debug_stroke,
      ..for (index, options) in options.pos().enumerate() {
        (numbering("(A)", index + 1), options)
      }
    )
  ]
}

#let frq(..options) = {
  table(
    columns: (auto, auto),
    inset: (x: 0.5em, y: 0.666em),
    stroke: debug_stroke,
    ..for (index, options) in options.pos().enumerate() {
      (numbering("a)", index + 1), options)
    }
  )
}

#let space(h) = {
  v(3em * h)
}

#let graph(w, h, s: 6mm) = {
  v(1.5em)
  rect(width: w*s, height: h*s, stroke: 0.5pt + luma(75%), fill: pattern(size: (s, s))[
    #rect(stroke: 0.5pt + luma(75%), width: s, height: s)
  ])
}

#let ruled(lines, s: 8mm) = {
  v(1.5em)
  for l in range(lines) {
    block(spacing: 0mm, line(length: 100%, stroke: 0.75pt + gray))
    v(s)
  }
}