(defun dichotomy(f a b eps)
    ;(format t "a = ~d; b = ~d eps = ~d; abs = ~d; bool = ~b ~%"
             ;a b eps
             ;(abs(- a b))
             ;(< (abs(- a b)) eps))
    (cond ((< (abs (funcall f a))
               eps)
            (return-from dichotomy a))
          ((< (abs (funcall f b))
              eps)
            (return-from dichotomy b))
          ((< (abs(- a b))
              eps)
            (return-from dichotomy 0)))
    (if (/= (signum (funcall f a))
            (signum (funcall f b)))
        (let ((r (dichotomy f a
                           (/ (+ a b) 2) eps)))
            (if (/= r 0)
                r
                (dichotomy f
                          (/ (+ a b) 2)
                           b
                           eps)))
        0))

(let ((n (dichotomy #'(lambda (x)
                              (+ (- (exp x) 2) x))
                    0 2.0 0.01)))
    (format t "exp(x) = 2-x, [0;2]~%")
    (format t "exp(~d) = ~d, [0;2]~%" n (exp n)))

