#!/usr/bin/sbcl --script
;;;; Tutorials point on Lisp
(write-line "Hello, World!")

(write (+ 7 9 11))

; comment sample


(write-line " ")
(write (* 2 3))
(write-line " ")
(write '(* 2 3))
;(write nil)
(write-line " ")

(setq y 34.567)
(setq bg 11.0e+5)
(setq r 128/2)

(print y)
(print bg)
(print r)

(defvar y 34.567)
(defvar bg 11.0e+5)
(defvar r 128/2)

(print (type-of y))
(print (type-of bg))
(print (type-of r))
(write-line " ")

; macro-definition

(defmacro setTo10(number)
	"macro which sets a given variable to 10"
	(setq number 10)
	(print number))

(defvar x 42)
(print x)
(setTo10 x)

(defvar x)
(defvar y)

(setq x 10)
(setq y 20)
(format t "x = ~2d; y = ~2d ~%" x y)

(setq x 1)
(setq y 2)
(format t "x = ~2d; y = ~2d ~%" x y)

(let ((a 'a) (b 'b) )
	(format t "a = ~a; b = ~a ~%" a b))

(prog ((c '(a b c)) (d '(d e f)))
	(format t "c = ~a; d = ~a ~%" c d))

(defconstant MY-CONST 3.1415)
(defun area-circle(rad)
	(terpri)
	(format t "Radius: ~5f" rad)
	(format t "~%Area: ~10f" (* MY-CONST rad rad)))
(area-circle 10)
(terpri)
