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
  (do ((i 0 (+ i 1)))
      ((>= i num) 'done)
    (princ ".")))

(defun print-dots  (num)
  (cond ((= num 0) 'done)
        (t (princ ".")
           (print-dots (- num 1)))))

(defun get-a-count (lst)
  (let ((count 0))
    (dolist (x lst)
      (cond ((eq x 'a) (setf count (+ count 1)))))
    count))
    
(defun get-a-count (lst)
  (cond ((null lst) 0)
        ((eq 'a (car lst)) (+ 1 (get-a-count (cdr lst))))
        (t (get-a-count (cdr lst)))))

;; 2-9
(defun summit (1st)
  (apply #'+ (remove nil lst)))

  
    

