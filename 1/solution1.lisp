(defparameter *input*
  (mapcar #'parse-integer 
    (uiop:read-file-lines "input1.txt")))

(defun count-increases (num-list)
  (if (<= (length num-list) 1) 0
    (if (> (second num-list) (first num-list))
      (+ 1 (count-increases (rest num-list)))
      (count-increases (rest num-list)))))

(print (count-increases *input*))
(terpri)
