(defparameter *input*
  (uiop:read-file-lines "input1.txt"))

(defun consume-line (line current-aim current-depth current-forward)
  (if (string= (subseq line 0 2) "up")
    (let ((aim-change (parse-integer (subseq line 3))))
      (list (- current-aim aim-change) current-depth current-forward))
      (if (string= (subseq line 0 4) "down")
        (let ((aim-change (parse-integer (subseq line 5))))
          (list (+ current-aim aim-change) current-depth current-forward))
        (let ((forward-step (parse-integer (subseq line 8))))
          (list current-aim 
            (+ current-depth (* current-aim forward-step))
            (+ current-forward forward-step))))))

(defparameter answer
  (reduce 
    #'(lambda (a b) (consume-line b (first a) (second a) (third a)))
    *input*
    :initial-value (list 0 0 0)))

(format t "Depth: ~a | Forward: ~a" (second answer) (third answer))
(terpri)
(format t "Answer: ~a" (* (second answer) (third answer)))
(terpri)
