(loop for name in '(alice bob tracy mary)
    do (format t "~a ~%" name))
(terpri)
(loop for n from 5 to 15 do
    (write (* n n))
    (terpri))
