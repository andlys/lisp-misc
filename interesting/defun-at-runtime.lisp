;;;; Code representing lisp's possibility of defining a named functions at 
;;;; runtime where the function name is also defined at runtime.
;;;; Note that you can't do this in the majority of other languages.
;;;; In lisp, every function definition is a list.

;; defining function
(eval 
    (substitute 'i-love-cats 'name 
        '(defun name ()
            (print "Yeah, I absolutely love cats!"))))
(i-love-cats) ; calling named function defined at runtime!
