;;;; problems are taken from there:
;;;; http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html
;;;; in order to find a corresponding problem look for pN comment
;;;; where N is a number of the problem


;;; p01
(defun my-last (lst)
    (if (null lst)
        nil)
        (if (null (cdr lst))
            (car lst)
            (my-last (cdr lst))))
(my-last nil)
(my-last '(a))
(my-last '(a b c d))

;;; p02
(defun my-but-last (lst)
    (if (null lst)
        nil
        (if (= 2 (length lst))
            lst
            (my-but-last (cdr lst)))))
(my-but-last nil)
(my-but-last '(a b))
(my-but-last '(a b c d))

;;; p03
(defun element-at (lst i)
    (if (null lst)
        nil
        (if (= i 1)
            (car lst)
            (element-at (cdr lst) (1- i)))))

(element-at nil 3)
(element-at '(a b c d e) 9)
(element-at '(a b c d e) 3)
(element-at '(a b c d e) 1)
(element-at '(a b c d e) 5)

;;; p04
(defun my-length (lst)
    (if (null lst)
        0
        (1+ (my-length (cdr lst)))))

(my-length nil)
(my-length '())
(my-length '(a))
(my-length '(a b c d))

;;; p05
(defun my-reverse (lst)
    (if lst
        (append (list (my-last lst))
                (my-reverse (butlast lst)))
        nil))
(my-reverse nil)
(my-reverse '())
(my-reverse '(a))
(my-reverse '(a b))
(my-reverse '(a b c))
(my-reverse '(a b c d))

;;; p06
(defun palindrome? (lst)
    (do ((k 0 (+ k 1))
         (m (1- (my-length lst)) (1- m)))
        ((<= m k) t)
       ;(format t "~D (~A) ~D (~A)~%" k (nth k lst) m (nth m lst))
       (when (not (eql (nth k lst)
                       (nth m lst)))
           (return-from palindrome? nil))))

(palindrome? nil)
(palindrome? '(a))
(palindrome? '(a b))
(palindrome? '(a b a))
(palindrome? '(a b c))
(palindrome? '(a b b a))
(palindrome? '(a b c a))
(palindrome? '(a b c b a))
(palindrome? '(a b c d e))
(palindrome? '(a b c d e f))
(palindrome? '(a b c d b a))
(palindrome? '(x a m a x))

;;; p07
(defun my-flatten (lst)
    (if (null lst)
        nil
        (if (every #'atom lst)
            lst
            (let ((elt (car lst)))
                (if (atom elt)
                    (append (list elt) (my-flatten (cdr lst)))
                    (append (my-flatten elt) (my-flatten (cdr lst))))))))

(my-flatten '(a (b c)))
(my-flatten '(a (b (c d) e)))
(my-flatten '((a a2 (a3 a4)) (b (c d) e)))

;;; p08
(defun compress (lst)
    (if (null lst)
        nil
        (cons (car lst)
              (compress-helper (cdr lst) (car lst)))))

(defun compress-helper (lst prev)
    (if (null lst)
        nil
        (if (eql prev (car lst))
            (compress-helper (cdr lst) prev)
            (cons (car lst)
                  (compress-helper (cdr lst) (car lst))))))

(compress '(a a a a b c c a a d e e e e))
(compress '(a b b b c))

;;; p09
(defun pack (lst)
    (if (null lst)
        nil
        (pack-helper (cdr lst)
                     (list (car lst)))))

(defun pack-helper (lst tmp)
    (if (null lst)
        (if (null tmp)
            nil
            (list tmp))
        (if (eql (car lst) (car tmp))
            (pack-helper (cdr lst)
                         (cons (car lst) tmp))
            (append (list tmp) (pack-helper
                                (cdr lst)
                                (list (car lst)))))))

(pack nil)
(pack '(a))
(pack '(a a b b))
(pack '(a b b))
(pack '(a b))
(pack '(a a b))
(pack '(a a a a b c c a a d e e e e))

;;; p10
(defun encode (lst)
    (if (null lst)
        nil
        (encode-helper (cdr lst)
                       (list (car lst)))))

(defun encode-helper (lst tmp)
    (if (null lst)
        (if (null tmp)
            nil
            (shorten tmp))
        (if (eql (car lst) (car tmp))
            (encode-helper (cdr lst)
                           (cons (car lst) tmp))
            (append (shorten tmp)
                    (encode-helper
                                (cdr lst)
                                (list (car lst)))))))

(defun shorten (lst)
    (list (cons (length lst)
                (cons (car lst) nil))))

(encode nil)
(encode '(a))
(encode '(a a b b))
(encode '(a b b))
(encode '(a b))
(encode '(a a b))
(encode '(a a a a b c c a a d e e e e))

;;; p11
(defun encode2 (lst)
    (if (null lst)
        nil
        (encode2-helper (cdr lst)
                       (list (car lst)))))

(defun encode2-helper (lst tmp)
    (if (null lst)
        (if (null tmp)
            nil
            (shorten2 tmp))
        (if (eql (car lst) (car tmp))
            (encode2-helper (cdr lst)
                           (cons (car lst) tmp))
            (append (shorten2 tmp)
                    (encode2-helper
                                (cdr lst)
                                (list (car lst)))))))

(defun shorten2 (lst)
    (if (null (cdr lst))
        (list (car lst))
        (list (cons (length lst)
                    (cons (car lst) nil)))))

(encode2 nil)
(encode2 '(a))
(encode2 '(a a b b))
(encode2 '(a b b))
(encode2 '(a b))
(encode2 '(a a b))
(encode2 '(a a a a b c c a a d e e e e))

;;; p12
(defun decode (lst)
    (if (null lst)
        nil
        (let ((new nil))
            (loop for elt in lst do
                (if (listp elt)
                    (setf new (append new
                                     (decode-helper elt)))
                    (setf new (append new (list elt)))))
            new)))

(defun decode-helper (lst)
    (let ((n (car lst))
          (sym (cadr lst))
          (new nil))
        (dotimes (k n)
            (setf new (cons sym new)))
        new))

(decode (encode2 nil))
(decode (encode2 '(a)))
(decode (encode2 '(a a b b)))
(decode (encode2 '(a b b)))
(decode (encode2 '(a b)))
(decode (encode2 '(a a b)))
(decode (encode2 '(a a a a b c c a a d e e e e)))

;;; p13
;;; TODO

;;; p14
(defun dupli (lst)
    (if (null lst)
        nil
        (cons (car lst)
              (cons (car lst)
                    (dupli (cdr lst))))))
(dupli '(a b c c d))

;;; p15
(defun repli (lst n)
    (if (null lst)
        nil
        (let ((new (list (car lst))))
            (dotimes (k (- n 1))
                (setf new (cons (car lst) new)))
            (append new (repli (cdr lst) n) nil))))
(repli '(a b c) 1)
(repli '(a b c) 2)
(repli '(a b c) 3)

;;; p16
(defun drop (lst n)
    (remove-if #'(lambda (x)
                    (zerop (mod
                            (+ (position x lst) 1)
                            n)))
               lst))

(drop '(a b c d e f g h i k) 3)

;;; p17
(defun split (lst n)
    (if (null lst)
        nil
        (let ((part1 nil)
              (part2 nil))
            (dotimes (i (length lst))
                (if (< i n)
                    (setf part1 (append part1 (list (nth i lst))))
                    (setf part2 (append part2 (list (nth i lst))))))
            (list part1 part2))))

(split '(a b c d e f g h i k) 3)

;;; p18
(defun slice (lst i k)
    (decf i)
    (decf k)
    (if (null lst)
        nil
        (let ((new nil))
            (loop for n from i to k do
                (setf new (append new (list (nth n lst)))))
            new)))

(slice '(a b c d e f g h i k) 3 7)

;;; p19
(defun rotate (lst n)
    (if (null lst)
        nil
        (let* ((k (if (>= n 0)
                    n
                    (+ (length lst) n)))
               (tmp (split lst k)))
            (append (second tmp) (first tmp)))))

(rotate '(a b c d e f g h) 3)
(rotate '(a b c d e f g h) -2)

;;; p20
(defun remove-at (lst k)
    (decf k)
    (if (null lst)
        nil
        (let ((tmp nil))
            (dotimes (i (length lst))
                (when (/= i k)
                    (setf tmp (append tmp (list (nth i lst))))))
            tmp)))

(defun remove-at2 (lst k)
    (decf k)
    (remove-if #'(lambda (elt)
                (if (= (position elt lst) k)
                    elt))
            lst))

(remove-at '(a b c d) 2)
(remove-at2 '(a b c d) 2)


;;; p28-a
(defun lsort (lst)
    (sort lst #'< :key #'(lambda (elt)
                             (length elt))))
(lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
