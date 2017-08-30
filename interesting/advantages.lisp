;;;; code shows advantages of lisp when it comes to manipulating data

(defstruct person
    (name 'none)
    (age 42))

(defparameter lst (loop for name in '(alice bob john kate arthur)
                        for age  in '(9 3 5 15 4)
                      collect (make-person :name name :age age)))

;; get the biggest age
(reduce #'max lst :key #'person-age)
;; get the smallest age
(reduce #'min lst :key #'person-age)
;; get total age of everybody
(reduce #'+ lst :key #'person-age)
;; find person with name alice
(find 'alice lst :key #'person-name)
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

;; get everybody sorted according to their age in descending order
(sort (copy-list lst) #'> :key #'person-age)

;; for everybody who is more than 9 years old set age of 42
(mapc #'(lambda (p)
          (unless (age-valid? (person-age p))
              (setf (person-age p) 42)))
       lst)

;; fill a lst with many identical persons
(make-list 7 :initial-element
          (make-person :name 'john#\ mccarthy
                       :age 90))
