(defun mul (a b) (* a b))

;(defun getfirst (list) ( ))
;(write "Hello world")

(defun printer () (write-line "i am a string") )

(defun sub (a b) (- a b))

(defun func(a) (
    if (< a 0)
        (format t "Number ~d is negative" a)
        (format t "Number ~d is positive" a)))
(defun f (l)
    (funcall l 3 4))
(f (lambda (a b) (* a b)))
(defun test(l) (funcall l 0))
(test (lambda (x) (- (exp x) 2 )))
