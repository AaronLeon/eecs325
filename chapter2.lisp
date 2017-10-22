(in-package :cs325-user)

;; 2-4
(defun greater (a b)
  (cond ((> a b) a)
        (t b)))

;; 2-7
(defun has-list-p (lst)
  (cond ((null lst) nil)
        ((listp (car lst)) t)
        (t (has-list-p (cdr lst)))))

;; 2-8
(defun print-dots (num)
  (do ((i 0 (1+ i)))
      ((>= i num) nil)
    (format t ".")))

(defun print-dots  (num)
  (cond ((= num 0) nil)
        (t (format t ".")
           (print-dots (1- num)))))

(defun get-a-count (lst)
  (do ((num 0 (cond ((eql (car rest) 'a) (1+ num))
                    (t num)))
       (rest lst (cdr rest)))
      ((null rest) num)))
    
(defun get-a-count (lst)
  (cond ((null lst) 0)
        ((eql 'a (car lst)) (1+ (get-a-count (cdr lst))))
        (t (get-a-count (cdr lst)))))

;; 2-9
; remove does not modify the original argument and instead returns the new list with the value removed. As a fix, I use the result of the remove expression directly as the argument of apply
(defun summit (lst)
  (apply #'+ (remove nil lst)))

; the original code never terminates because there is no base case to terminate the recursion. Here I added a case in the cond statement to check if (null lst) and return 0 if it is because the sum
; of an empty list is 0. This allows the recursion to end.
(defun summit (lst)
  (cond ((null lst) 0)
        ((null (car lst)) (summit (cdr lst)))
        (t (+ (car lst) (summit (cdr lst)))))) 
