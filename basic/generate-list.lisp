(defun generate-list(n m)
    "function generates list of integer numbers from 'n to 'm"
    (let ((lst (list)))
        (loop for k from n to m do
            ;(print lst)
            (setq lst (append lst (list k))))
        lst))

(print (generate-list 5 8))
(print (generate-list 10 20))
(let ((lst (generate-list 0 100)))
    (setq lst (remove-if-not #'oddp lst))
    (print lst))
