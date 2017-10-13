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
(defun summit (lst)
  (apply #'+ (remove nil lst)))

(defun summit (lst)
  (cond ((null lst) 0)
        ((null (car lst)) (summit (cdr lst)))
        (t (+ (car lst) (summit (cdr lst)))))) 
              