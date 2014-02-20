(TeX-add-style-hook "testTimeAndSimpleUse"
 (lambda ()
    (LaTeX-add-bibliographies)
    (TeX-run-style-hooks
     "inputenc"
     "utf8"
     "fullpage"
     "hyperref"
     "latex2e"
     "art10"
     "article")))

