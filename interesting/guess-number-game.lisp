;;;; A game where a player tries to guess a number that was chosen randomly.

(defconstant seed (make-random-state t))

(defun play ()
    (write-line "Storing an integer number between 0 and 10 (excluding 10)...")
    (let ((number (random 10 seed)))
        ;(format t "Pssss... The actual number is ~D~%" number)
        (do ((attempts 3 (- attempts 1)))
            ((eql attempts 0))
            (format t "You have ~D attempts so far. ~%~
                    Guess the number: ~%"
                    attempts)
            (let ((input (read)))
                (if (integerp input)
                    (if (eql input number)
                        (progn 
                            (write-line "Correct! Congratulations!")
                            (return-from play nil))
                        (if (> input number)
                            (write-line "The actual number is smaller!")
                            (write-line "The actual number is bigger!")))
                    (progn
                        (write-line "Bad input")
                        (incf attempts)))))
            (format t "You lost... The actual number was ~D~%" number)))

(play)
