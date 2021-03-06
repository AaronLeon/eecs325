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
  (cond ((atom lst) (format t "~S" lst))
        (t (format t "[")
           (format t "~S" (car lst))
           (show-list-helper (cdr lst))
           (format t "]"))))


(defun show-list-helper (lst)
  (cond ((null lst) nil)
        (t (show-list (car lst))
           (format t " ")
           (if (listp (cdr lst))
               (show-list-helper (cdr lst))
             (format t ". ~S" (cdr lst)))))

(eql (last lst) (car lst)

;; 3-9

(defun longest-path (start end net)
  (dfs end (list (list start)) net))

(defun dfs (end queue net)
  (unless queue (return-from dfs))
  (let* ((path (car queue))
         (node (car path)))
    (if (eql node end)
        (return-from dfs (reverse path)))
    (dfs end
         (append (new-paths path node net)
                 (cdr queue))
         net)))

(defun new-paths (path node net)
  (mapcan #'(lambda (n)
              (cond ((not (member n path)) (list (cons n path)))))
          (cdr (assoc node net))))
  
  
  