(in-package :cs325-user)

;; (a)
(defun shortest-path (start end net)
  (catch 'abort (bfs end (list (list start)) net)))

(defun bfs (end queue net)
  (if (empty-queue-p queue)
      nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (bfs end
             (append (cdr queue)
                     (remove nil (new-paths path node net end)))
             net)))))
 
(defun new-paths (path node net end)
  (mapcar #'(lambda (n)
              (when (eql n end) (throw 'abort (reverse (cons n path))))
              (unless (member n path) (cons n path)))
          (cdr (assoc node net))))

;; (b)
(defun shortest-path (start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (if (empty-queue-p queue)
      nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (bfs end
             (append (cdr queue)
                     (remove nil (mapcar #'(lambda (n)
                                             (when (eql n end)
                                               (return-from bfs (reverse (cons n path))))
                                             (unless (member n path) 
                                               (cons n path)))
                                         (cdr (assoc node net)))))
             net)))))

  