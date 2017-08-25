;;;; code from a tutorial

(write (setf my-array (make-array '(10))))
(terpri)
(setf (aref my-array 0) 25)
(setf (aref my-array 1) 23)
(setf (aref my-array 2) 45)
(setf (aref my-array 3) 10)
(setf (aref my-array 4) 20)
(setf (aref my-array 5) 17)
(setf (aref my-array 6) 25)
(setf (aref my-array 7) 19)
(setf (aref my-array 8) 67)
(setf (aref my-array 9) 30)
(write my-array)


(terpri)
(setf x (make-array '(3 3) 
   :initial-contents '((0 1 2 ) (3 4 5) (6 7 8)))
)
(write x)


(setq a (make-array '(4 3)))
(dotimes (i 4)
   (dotimes (j 3)
      (setf (aref a i j) (list i 'x j '= (* i j)))
   )
)
(dotimes (i 4)
   (dotimes (j 3)
      (print (aref a i j))
   )
)


