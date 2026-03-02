#import "@preview/catppuccin:1.1.0": catppuccin, macchiato
#import "@local/language_worksheet:0.0.1" as ws

#set text(font: "Atkinson Hyperlegible", size: 8pt)
#set page(margin: 1.5cm)

#let theme = macchiato
#show: catppuccin.with(theme)
#set page(margin: 0.6cm, columns: 2)
#let state = ws.worksheet(theme: theme)

#let tsv(path) = {
  let data = read(path)
  let data = data
    .split("\n")
    // filter empty lines
    .filter(row => row.len() > 0)
    .map(row => row.split("\t").map(item => item.trim()))
  let data = data.filter(item => item.len() > 0 and item != none)
  return data
}

= Werkblad 2
#ws.text_block(state)[
  == Tenses in Dutch
  For now, we are going to focus on two tenses in Dutch.

  === Simple present (`onvoltooid tegenwoordige tijd`)
  The simplest case, it describes an action which is not finished, ie. "Ik loop", "Ik werk", "Ik eet".

  === Perfect present (`voltooid tegenwoordige tijd`)
  This case is more complex because two words are used.

  This is because a form of "hebben" (to have) changes along with the subject, which inflects as usual.

  For weak verbs, the voltooid deelwoord is created with "ge" + the stam (root).

  Therefore, to say "I have eaten something", the phrase would be "Ik heb iets gegeten".
]

#ws.fill_conjugation_exercise(tsv("conjugation_blanks.tsv"), state)
#ws.word_list(tsv("./words.tsv"), state)
#let sentences = (
  tsv("../conjugations/vergeten.tsv").flatten().filter(x => x.len() > 0).map(x => eval(x, mode: "markup"))
)

#ws.custom_table(
  state,
  sentences,
  [== Conjugation 'Vergeten'],
  table.header[Person][Present][Past],
  (auto, 1fr, 1fr),
)

#ws.word_order_exercise(tsv("./sentences.tsv"), state)
