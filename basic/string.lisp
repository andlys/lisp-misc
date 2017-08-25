(write-line (string-capitalize "\"artificial intelligence with python\""))
(write-line (string-upcase "\"artificial intelligence with python\""))

(defvar str "something")
(setf (aref str 2) #\e)
(print (aref str 2))
(terpri)
(write-line str)

(terpri)

(let ((str "Lisp"))
(loop for c across str
    do (print c)))

(terpri)

(write (delete-if #'evenp '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)


(write-line (delete #\L (string-capitalize "lisp")))

;(let ((lam (lambda (str) (0)))))


(print (elt "lisp" 2))
