# Vowel duration and aspiration effects in Icelandic (University of York)

This is the [research compendium](https://github.com/ropensci/rrrpkg) of my MA thesis: *Vowel duration and aspiration effects in Icelandic* (MA in Phonetics and Phonology, University of York).

## License

`R` source code file and the files in `task/` are licensed under the [MIT License](https://github.com/stefanocoretta/ma-thesis-york/blob/master/LICENSE.md). The images in `dissertation/img/` are under [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/). Anything else follows the academic conventions of proper referencing.

## Reproducibility

To run the `R` code and compile `dissertation.Rnw`, follow these steps:

1. clone or download this repository
1. download the `data` folder from [here](https://osf.io/6au2k/)
1. unzip it and move it into `ma-thesis-york`
1. run `get-measurements.praat` and `images.praat` in Praat
1. run `knitr` on `dissertation.Rnw`
