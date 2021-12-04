(defparameter *input*
  (mapcar #'parse-integer 
    (uiop:read-file-lines "input2.txt")))

(defun count-increases (num-list)
  (if (<= (length num-list) 3) 0
    (if (> 
      (+ (second num-list) (third num-list) (fourth num-list))
      (+ (first num-list) (second num-list) (third num-list)))
        (+ 1 (count-increases (rest num-list)))
        (count-increases (rest num-list)))))

(print (count-increases *input*))
(terpri)
