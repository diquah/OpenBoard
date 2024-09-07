# OpenBoard

<h3 align="center">
 Easily build clean assessments in the style of the College Board.
</h3>
<p align="center">
  <img width="75%" src="...">
</p>

Typst template and framework for creating professional and clean exams of any kind, in the style of College Board exams.

- The template is **colorless to be as print-friendly** as possible.

- The template uses **free fonts already included in the Typst web app** to minimize external dependencies. The instructional font is _Roboto Slab_, the primary font is _STIX Two Text_, and the math font is _STIX Two Math_.

- The template is extremely **modular and flexible**, supporting multiple choice questions with unlimited choices, free response questions with unlimited subquestions (blank, ruled, and graph templates), and long-form essay style questions.


## Building an assessment:

Import and initialize the template.
```typst
#import "openboard.typ": *

#show: doc => template(
  paper: "us-letter",
  doc,
)

// The rest of the assessment will go here.
```

A prompt is an enumerated 'question' in the assessment.
```typst
#prompt[
  Question goes here.
]
```

The prompt can have a multiple-choice attachment.
```typst
#prompt[
  Question goes here.
  #mcq(
    [These options],
    [are automatically],
    [enumerated with letters A, B, C, etc.],
    [and can be as many or few],
    [as you wish],
  )
]
```

Alternatively, prompts can have a free-response attachment.
```typst
#prompt[
  This is the overall problem statement.
  #frq(
    [
      Sub-questions can have blank space for response.
      #space(1) // Increase the number for more or less space.
    ],
    [
      They can have ruled/lined paper for a more structured written response.
      #ruled(5) // Increase the number for more or less lines.
    ],
    [
      They can have empty graph paper as well.
      #graph(22, 10) // Change the numbers to change the (X, Y) size of the graph.
    ],
  )
]
```

This is a free response with no subparts.
```typst
#prompt[
  This is the overall problem statement.
  #ruled(5)
]
```

See the example exam source for more elements that can be used.