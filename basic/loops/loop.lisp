(defvar n 1)
(loop
    (write "Loop iteration ")
    (write n)
    (terpri)
    (incf n)
    (when (> n 10)
        (return)))
;(terpri)
