;;;; code shows advantages of lisp when it comes to manipulating data

(defstruct person
    (name 'none)
    (age 42))

(defparameter lst (loop for name in '(alice bob john kate arthur)
                        for age  in '(9 3 6 15 4)
                      collect (make-person :name name :age age)))

;; get the biggest age
(reduce #'max lst :key #'person-age)
;; get the smallest age
(reduce #'min lst :key #'person-age)
;; get total age of everybody
(reduce #'+ lst :key #'person-age)
;; find person with name alice
(find 'alice lst :key #'person-name)
;; find person of age 4
(find 4 lst :key #'person-age)
;; get the oldest person
(find (reduce #'max lst :key #'person-age)
       lst :key #'person-age)
;; get the youngest person
(find (reduce #'min lst :key #'person-age)
       lst :key #'person-age)

;; get everybody who is 9 or less years old in a new list
;; note: 'remove-if-not' is a 'filter' function, only named differently
(defun age-valid? (age) (<= age 9))
(remove-if-not #'age-valid? lst :key #'person-age)

;; get a number of persons 9 y. o. or less
(count-if #'age-valid? lst :key #'person-age)

;; get everybody whose age is even
(remove-if-not #'evenp lst :key #'person-age)

;; get everybody whose age is odd
(remove-if-not #'oddp lst :key #'person-age)

;; get everybody sorted according to their age in descending order
(sort (copy-list lst) #'> :key #'person-age)

;; get everybody sorted according to the name in ascending order
(sort (copy-list lst) #'string<=
    :key #'(lambda (p) (string (person-name p))))

;; get everybody sorted according to length of the name in ascending order
(sort (copy-list lst) #'<
    :key #'(lambda (p) (length (string (person-name p)))))

;; for everybody who is more than 9 years old set age of 42
(mapc #'(lambda (p)
          (unless (age-valid? (person-age p))
              (setf (person-age p) 42)))
       lst)

;; fill a lst with many identical persons
(make-list 7 :initial-element
          (make-person :name 'john#\ mccarthy
                       :age 90))

;; sum of all days in each month of a year
(apply #'+ '(31 28 31 30 31 30 31 31 30 31 30 31)) ; => 365


;; an excercise takes from paul graham's book
;; closure technique used
;; description: function that takes one number and returns the greatest number
;; passed to it so far
(let (lst)
  (defun highest (n)
    (reduce #'max (push n lst))))

(highest 0)
(highest 1)
(highest -1)
(highest 3)
(highest 2)

;; example of macro's usefulness 
(defmacro iff (test then &optional else)
  `(let ((val ,test))
     (cond (val ,then)
           (t ,else))))

;; variable capture example
;; value of test-expression is captured from macro
;; this is impossible in other languages
(iff (member 'd '(a b c d e f))
     val
     'nothing-found)
