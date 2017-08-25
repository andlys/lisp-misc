(defun print-lists (lists)
    (dotimes (n (1- (length (car lists))))
        (dolist (lst lists)
                (format t "~A" (nth n lst)))
        (terpri)))

(defvar seed (make-random-state t))

;;; returns either 0 or 1
(defun flip-coin () (random 2 seed))

(let ((lists)
     (lst))
    (dotimes (n 80)
        (setf lst nil)
        (dotimes (flips 10)
            (push (flip-coin) lst))
        (push (apply #'+ lst) lst)
        (push (sort lst #'<) lists))
    (setf lists
        (sort lists
              #'(lambda (lst1 lst2)
                (< (car (last lst1))
                   (car (last lst2))))))
    (print-lists lists)
    (let* ((total (* (1- (length (car lists))) (length lists)))
           (ones  (apply #'+ (mapcar #'(lambda (lst) (car (last lst))) lists)))
           (zeros (- total ones)))
        (format t "Total flips: ~A~%~
                   Heads: ~A~%~
                   Tails: ~A~%~
                   Min heads: ~A~%~
                   Avg heads: ~A~%~
                   Max heads: ~A~%"
                total
                ones
                zeros
                (car (last (first lists)))
                (+ (/ ones (length lists)) 0.0)
                (car (last (car (last lists)))))))

