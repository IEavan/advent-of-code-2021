(defparameter *input*
  (uiop:read-file-lines "input1.txt"))

(defun sum-on-prefix (lines prefix) 
  (reduce #'+
    (let ((prefix-length (length prefix)))
      (mapcar #'(lambda (line) (parse-integer (subseq line (+ prefix-length 1))))
        (remove-if #'(lambda (line) 
          (or 
            (<= (length line) prefix-length)
            (not (string= (subseq line 0 prefix-length) prefix))))
          lines)))))

(defparameter total-forward 
  (sum-on-prefix *input* "forward"))
(defparameter total-up
  (sum-on-prefix *input* "up"))
(defparameter total-down
  (sum-on-prefix *input* "down"))

(format t "Answer: ~a" (* total-forward (- total-down total-up)))
(terpri)
