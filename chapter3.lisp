(in-package :cs325-user)
;; 3-8
(defun show-dots (lst)
  (cond ((atom lst) (format t "~a" lst))
        (t (format t "(")
           (show-dots (car lst))
           (format t " . ")
           (show-dots (cdr lst))
           (format t ")"))))

(defun show-list (lst)
  (cond ((atom lst) (format t "~a" lst))
        (t (format t "[")
           (show-list-helper lst)
           (format t "]"))))


(defun show-list-helper (lst)
  (cond ((null lst) nil)
        (t (show-list (car lst))
           (when (cdr lst)
             (format t " "))
           (if (listp (cdr lst))
               (show-list-helper (cdr lst))
             (format t ". ~a" (cdr lst))))))
  