(defparameter *input*
  (uiop:read-file-lines "input1.txt"))

(defun count-ones-in-col (lines col)
  (length 
    (remove-if
      #'(lambda (line) (char= (char line col) #\0))
      lines)))

(defun strlogflip (str)
  (reduce #'uiop:strcat
    (loop :for i :below (length str) :collect
      (if (char= (char str i) #\0) "1" "0"))))

(defparameter most-common
  (reduce #'uiop:strcat
    (let ((num-lines (length *input*)) (bits (length (first *input*))))
      (loop :for i :below bits :collect
        (if (> (count-ones-in-col *input* i) (/ num-lines 2))
          "1"
          "0")))))

(format t "Answer: ~a" 
  (* 
   (parse-integer most-common :radix 2) 
   (parse-integer (strlogflip most-common) :radix 2)))
(terpri)
