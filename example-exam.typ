#import "openboard.typ": *

#show: doc => template(
  paper: "us-letter",
  doc,
)

#title(
  title: "Example Exam",
  subtitle: "Using OpenBoard and Typst",
  organization: "University of the Internet",
  class: "Typography 101",
  collect_info: ("Name", "ID"),
  exam_version: "A",
)

#instruct[
  == Initial Instructions Before Exam
  
  #lorem(50)

  #lorem(50)

  This exam consists of three parts:

  #pad(left: 2em)[
    - *MCQ*: Multiple Choice Questions.
  
    - *FRQ*: Free Response Questions.
    
    - *DBQ*: Document Based Questions (essay response).
  ]
  
  \
  You will have a total of *45 minutes* to complete all sections.
]

#pagebreak()
#section_header("MCQ", info: [*Scientific Calculator Permitted*])

#prompt[
  This is an example of a *multiple choice* question. #lorem(20)
  #mcq(
    [#lorem(10)],
    [#lorem(21)],
    [#lorem(7)],
    [#lorem(9)],
  )
]

#prompt[
  Multiple choice questions can have *any amount of options*. #lorem(20)
  #mcq(
    [#lorem(10)],
    [#lorem(21)],
    [#lorem(7)],
    [#lorem(9)],
    [#lorem(6)],
    [#lorem(8)],
    [...]
  )
]

#prompt[
  #lorem(5) $x_A (t) = -3t^2+t+4$. #lorem(12)
  #mcq(
    [3.2],
    [4.7],
    [5.2],
    [None of the above.],
  )
]

#prompt[
  #lorem(20)
  #mcq(
    [#lorem(10)],
    [#lorem(7)],
    [#lorem(9)],
    [#lorem(8)],
  )
]

#prompt[
  #lorem(20)
  #mcq(
    [#lorem(10)],
    [#lorem(7)],
    [#lorem(9)],
    [#lorem(8)],
  )
]

#pagebreak()
#section_header("FRQ", info: [*Calculators are not permitted.*\ #lorem(20) Show all work. ])

#prompt[
  This is an example of a *free response* question. They can have any number of sub-questions. #lorem(20)
  #frq(
    [
      *Contemplate* this empty space.
      #space(1)
    ],
    [
      *Explain* on these ruled lines.
      #ruled(5)
    ],
    [
      *Draw* on this graph-ruled section.
      #graph(22, 10)
    ],
  )
]

#pagebreak()
#section_header("DBQ")

#custom_prompt(
  "Document 1.",
  [
    #lorem(100)
  
    #lorem(70)
  ]
)

#custom_prompt(
  "Document 2.",
  [
    #lorem(50)
    
    #lorem(25)

    #lorem(30)
  ]
)

#prompt(allow_overrun: true)[
  #lorem(30)
  #ruled(52)
]