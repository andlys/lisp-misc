(print (eq (list 'a 'b 'c) (list 'a 'b 'c)))
(print (equal (list 'a 'b 'c) (list 'a 'b 'c)))
(print (equal (list 'a 'b 'c) (list 'a 'b 'd)))

(print (eq 'a 'a))
(print (eq 'a 'b))

(print (atom 'a))
(print (atom (list 'a 'b)))
(print (listp (list 'a 'b)))

(print (evenp 50))
(print (oddp 51))


(defvar k 3/6)
(print k)
(print (numerator k))
(print (denominator k))

(print (numberp 9))

(print (eq 3/2 1.5))
(print (eql 3/2 1.5))
(print (equal 3/2 1.5))

(print (characterp #\a))

(print (code-char (+ (char-code #\в) 1)))

