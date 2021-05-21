;Add frame
(defun put_frm (frame father slots_info)
  (setf (get frame 'frm_name) frame)
  (setf (get frame 'father) father)
  ;добавить наследование свойств из инфо
  (setf (get frame 'created_at) (get-universal-time))
  (setf (get frame 'info) slots_info)
  ;первоначально дочерний список пуст
  (setf (get frame 'child_list) ())
  t
)

(defun add_frm (fr_str new_fr father info)
  (cond 
  	((and (not (equal (get fr_str `frm_name) father))(null(get fr_str `child_list))) nil); отец не найден
    (
      (equal (get fr_str `frm_name) father); нашли отца
      (put_frm new_fr father info); создаем фрейм
	  ;добавляемый фрейм включается в список детей к отцу 
	  (setf (get father `child_list) (cons new_fr (get father `child_list)))
	)
	(t (add_frm_child (get fr_str `child_list) new_fr father info))
  )
)

(defun add_frm_child (children new_fr father slots)
  (cond
  	((null children) (print "отец не найден") nil)
    ((add_frm (car children) new_fr father slots) t); получилось вставить
    (t  (add_frm_child (cdr children) new_fr father slots)); ищем отца дальше
  )
)

;Show struct
(defun show_str_fr (dist_fm otstup)
  (setq reso(concatenate 'string reso
  	(format nil "~[  ~;    ~;      ~;       ~;        ~]* ~A~%" otstup (get dist_fm 'frm_name))
  ))
  (mapcar (lambda (y) (show_str_fr y (+ otstup 1)) ) (get dist_fm 'child_list))
  reso
)

;Search frame
(defun search_fr (dist_fm param value)
  (cond
  	((string-equal value (cdr (assoc param (get dist_fm 'info))))
	(setq result (cons dist_fm result)))	
  )
  (mapcar (lambda (y) (search_fr y param value) ) (get dist_fm 'child_list))
  result
)

#|
(defun show_str_fr (dist_fm otstup)
  (format t "~[~; ~;  ~;   ~;    ~]. ~A~%" otstup (get dist_fm 'frm_name) )
  (mapcar (lambda (y) (show_str_fr y (+ otstup 1)) ) (get dist_fm 'child_list))
)

(defun show_str_fr (dist_fm otstup children)
  ;(setq results (concatenate 'string results (format t "~[~; ~;  ~;   ~]. ~A~%" otstup (get dist_fm 'frm_name) ) ) )
  (format t "~[~; ~;  ~;   ~]. ~A~%" otstup (get dist_fm 'frm_name) )
  (setq children (get dist_fm 'child_list))
  (cond
    ((NOT(NULL children))
	  (loop for i from 1 to (list-length children) do
        (show_str_fr (car children) (+ otstup 1) nil)
	    (setq children (cdr children))
	))
    (t nil)
  )
)

(defun search_fr (dist_fm param value children)
  (cond
    ((string-equal (write-to-string value) (write-to-string(cdr (assoc param (get dist_fm 'info) ))))
	(setq result (cons dist_fm result)) )
  )
  (setq children (get dist_fm 'child_list))
  (cond
    ((NOT(NULL children))
      (loop for i from 1 to (list-length children) do
	    (search_fr (car children) param value nil)
		(setq children (cdr children))
	))
	(t nil)
  )
  result
)
|#