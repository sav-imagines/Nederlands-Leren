#import "@preview/catppuccin:1.1.0": catppuccin, macchiato
#import "@local/language_worksheet:0.0.1": conjugation_table, fill_conjugation_exercise, word_order_exercise, worksheet

#set text(font: "NimbusSanL", size: 10.8pt, lang: "nl")

#let theme = macchiato
#show: catppuccin.with(theme)
#set page(margin: 0.6cm, columns: 2)
#let state = worksheet(theme: theme)
#let tsv(path) = csv(path, delimiter: "	")

= Werkblad 1
#word_order_exercise(tsv("sentences.tsv"), state)
#fill_conjugation_exercise(tsv("./conjugation_blanks.tsv"), state)
#conjugation_table(tsv("../conjugations/hebben.tsv"), state, "hebben")
#conjugation_table(tsv("../conjugations/zijn.tsv"), state, "zijn")
