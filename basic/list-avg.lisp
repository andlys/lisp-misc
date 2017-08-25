(defun listavg(lst)
    "returns arithmetical average of numbers in lst"
    (let ((total 0))
        (loop for n in lst do
            (setq total (+ total n)))
    (float (/ total (length lst)))))

(print (listavg '(5 10)))
(terpri)

(defun listavg2(lst)
    "modified listavg"
    (float (/ (reduce #'+ lst) (length lst))))

(print (listavg2 '(5 10)))
