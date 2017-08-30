;;; moves elt from one stack to another
;;; destructive function
;;; a b c - stacks
;;; n - number of first piles to move
(defun move (a b c n)
    (format t "~A ~A ~A ~%" a b c)
    (if (zerop n)
        (return-from move (values a b c)))
    (multiple-value-bind (aa bb cc) (move a c b (1- n))
        (setf a aa
              b cc
              c bb))
    (push (pop a) c)
    (multiple-value-bind (aa bb cc) (move b a c (1- n))
        (setf a bb
              b aa
              c cc))
    (format t "LAST ~A ~A ~A ~%" a b c)
    (values a b c))

(move '() '() '() 0)
(move '(1) '() '() 1)
(move '(1 2) '() '() 2)
(move '(1 2 3) '() '() 3)
(move '(1 2 3 4) '() '() 4)


#|
# Hanoi-tower: my algorithm implemented in python works perfectly well.
# However when it comes to my Lisp implementation of the altorithm, due to 
# a slightly different Lisp memory model, code becomes a little trickier.

def move (a, b, c, n):
    if n == 0:
        return
    print "%s %s %s" % (a, b, c)
    move(a, c, b, n - 1)
    c.append(a.pop())
    move(b, a, c, n - 1)
    print "LAST %s %s %s" % (a, b, c)

move([], [], [], 0)
move([1], [], [], 1)
move([1, 2], [], [], 2)
move([1, 2, 3], [], [], 3)
move([1, 2, 3, 4], [], [], 4)
|#
