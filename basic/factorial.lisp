;;; comment:  far not the very best version of factorial =)
;;; implementation is more effective with iterative approach
(defun factorial(n)
    (if (= n 0)
        1
        (* n (factorial (- n 1)))))

;(print (factorial 3))

(loop for item in (list 0 1 2 3 4 5 6 7) do
    (format t "factorial(~d) = ~d ~%" item (factorial item)))
