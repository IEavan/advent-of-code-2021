(defparameter *input*
  (uiop:read-file-lines "input1.txt"))

(defun count-ones-in-col (lines col)
  (length 
    (remove-if
      #'(lambda (line) (char= (char line col) #\0))
      lines)))

(defun filter-maj-min (lines current-col should-find-maj)
  (let 
    ((most-common-char 
       (if 
         (>= 
           (count-ones-in-col lines current-col) 
           (/ (length lines) 2) ) 
         #\1 
         #\0))) 
    (remove-if 
      #'(lambda (line) (let ((line-is-maj (char= (char line current-col) most-common-char)))
                         (if should-find-maj (not line-is-maj) line-is-maj)))
      lines)))

(defun get-maj-min (lines current-col should-find-maj)
  (if 
    (= (length lines) 1) 
    (first lines)
    (get-maj-min 
      (filter-maj-min lines current-col should-find-maj) 
      (+ current-col 1)
      should-find-maj)))

(format t "Majority: ~a" (parse-integer (get-maj-min *input* 0 t) :radix 2))
(terpri)
(format t "Majority: ~a" (parse-integer (get-maj-min *input* 0 Nil) :radix 2))
(terpri)
