;;;; following excercises are from
;;;; https://adriann.github.io/programming_problems.html

; Elementary ex 8
(defun primep (n)
    (do ((k (- n 1) (- k 1)))
        ((<= k 1))
        (when (zerop (mod n k))
            (return-from primep nil)))
    t)

(loop for n from 1e6 to 1e7 do
    (when (primep n)
        (format t "~D is prime~%" n)))

;;; Elementary ex 11
;;; see this file: sppe11.png
(defun sigma(func start end)
    (let ((total 0.0))
        (loop for k from start to end do
            (setf total (+ total (funcall func k))))
    total))

(print (sigma #'(lambda (k) 
                (/ (expt -1 (+ k 1))
                    (- (* 2 k) 1)))
            1 1e6))
