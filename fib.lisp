(defun my-fib (n)
  (if (< n 2) n
    (+ (my-fib (- n 1)) (my-fib (- n 2)))))
(print (my-fib 30))
(terpri)
