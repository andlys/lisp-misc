;
(defparameter lim 10)

(let* ((seed (make-random-state t))
       (seed2 (make-random-state seed)))
    (dotimes (n 5)
        (print (random lim seed)))
    (terpri)
    (dotimes (n 5)
        (print (random lim seed2))))
