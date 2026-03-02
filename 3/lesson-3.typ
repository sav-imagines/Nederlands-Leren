#import "@preview/catppuccin:1.1.0": catppuccin, macchiato
#import "@local/language_worksheet:0.0.1" as ws

#set text(font: "Atkinson Hyperlegible", size: 6pt)
#set page(margin: 1.5cm)

#let theme = macchiato
#show: catppuccin.with(theme)
#set page(margin: 0.6cm, columns: 2)
#let state = ws.worksheet(theme: theme)
#show table.cell.where(y: 0): strong

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

= Werkblad 3
#ws.fill_conjugation_exercise(tsv("./fill_article.tsv"), state)

#ws.rounded_block(state.theme, theme.colors.mauve.rgb)[
  == Lidwoorden
  Articles are used just like in English. However, there are two definite articles, because of gendered words.
  #show table.header: strong
  #table(
    stroke: theme.colors.subtext0.rgb,
    columns: 2,
    table.header[Article][Use],
  )[De][Masculine/Feminine nouns (majority of words)][Het][Neuter nouns]

  Some rules which are good to know:
  - Diminutives are always neuter (de tafel, het tafeltje)
  - Nouns made from infinitive verbs use 'het' (het wandelen, het gaan)
  - Plurals are 'de' (het ei, de eieren)
]

#ws.word_list(tsv("./words.tsv"), state)

#colbreak()
#let lines = tsv("../conjugations/zoeken.tsv").flatten().filter(x => x.len() > 0).map(x => eval(x, mode: "markup"))
#ws.custom_table(
  state,
  lines,
  [== Conjugation 'Zoeken'],
  table.header[Person][Present][Past],
  (auto, 1fr, 1fr),
)

#ws.rounded_block(state.theme, theme.colors.peach.rgb)[
  == Sterke en zwakke werkwoorden
  In dutch, all verbs are either 'strong' or 'weak'.

  Strong verbs' main vowel changes in the past tense.
  This means that you need to know their conjugation, and can't guess it.

  For weak verbs, the rules to them are as follows:

  For verbs that end in one of the consonants of `'t ex-kofschip` (one of `txkfschp`),
  the past tense is derived as `stam + te`. Other verbs end in `stam + de`.
]

#let lines = tsv("../conjugations/kunnen.tsv").flatten().filter(x => x.len() > 0).map(x => eval(x, mode: "markup"))
#ws.custom_table(
  state,
  lines,
  [== Conjugation 'Kunnen'],
  table.header[Person][Present][Past],
  (auto, 1fr, 1fr),
)

#let lines = tsv("../conjugations/hebben.tsv").flatten().filter(x => x.len() > 0).map(x => eval(x, mode: "markup"))
#ws.custom_table(
  state,
  lines,
  [== Conjugation 'Hebben'],
  table.header[Person][Present][Past],
  (auto, 1fr, 1fr),
)
#ws.fill_conjugation_exercise(tsv("./sentences.tsv"), state)
