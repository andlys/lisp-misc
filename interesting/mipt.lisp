;;;; A code used to demonstrate a funny joke MIPT students have.

(defun nextChr (chr)
    (code-char (+ (char-code chr) 1)))

(defun M (input)
    (map 'string 
         #'(lambda (chr) (nextChr chr))
         input))

(write-line (M "ABCDE")) ; example
(write-line (M "12345")) ; example
(write-line (M "11111")) ; example
(write-line (M "AAAAA")) ; example
(write-line (M "ФТИ"))   ; the joke, uses cyrillic symbols as input
