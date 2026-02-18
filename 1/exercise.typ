#import "@preview/catppuccin:1.1.0": catppuccin, macchiato
#import "@local/language_worksheet:0.0.1": conjugation-table, fill_conjugation_exercise, word_order_exercise, worksheet


#let theme = macchiato
#show: catppuccin.with(theme)
#set page(margin: 0.6cm, columns: 2)
#let state = worksheet(theme: theme)

= Werkblad 1
#word_order_exercise(csv("sentences.tsv", delimiter: "	"), state)
#fill_conjugation_exercise(csv("./conjugation_blanks.tsv", delimiter: "	"), state)
#conjugation-table(csv("../conjugations/hebben.tsv", delimiter: "	"), state, "hebben")
#conjugation-table(csv("../conjugations/zijn.tsv", delimiter: "	"), state, "zijn")
