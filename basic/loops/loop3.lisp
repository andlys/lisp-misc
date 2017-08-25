(do ((x 2 (+ x 2)))
    ((= x 16))
    (format t "x = ~d ~%" x))

(dotimes (n 11)
    (print n) (prin1 (* n n)))

(dolist (n '(1 2 3 4 5 6 7 8 9))
   (format t "~% Number: ~d Square: ~d" n (* n n))
)
