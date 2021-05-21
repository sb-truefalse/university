;Глобальная структура
(setf (get 'dist 'frm_name) 'dist)
(setf (get 'dist 'created_at) (get-universal-time))
;Для поиска
(setq result nil)
;Для показа структуры
(setq reso "")
;Для формы
(setq show_text "Результат команды")

#|SEED|#
;Базовые структуры
(add_frm 'dist 'math 'dist '((type . "математические")))
(add_frm 'dist 'gumo 'dist '((type . "гуманитарный")))
(add_frm 'dist 'prof 'dist '((type . "проффесиональный")))
;Наполнение
(add_frm 'dist 'math1 'math '((name . "матан1") (form . "1") (year . "2018") (pulpit . "aoi") (control . "1") (hours . "100")))
(add_frm 'dist 'math2 'math '((name . "матан2") (form . "1") (year . "2017") (pulpit . "aoi") (control . "1") (hours . "100")))
(add_frm 'dist 'math21 'math2 '((name . "матан2.1") (form . "1") (year . "2018") (pulpit . "aoi") (control . "1") (hours . "100")))
(add_frm 'dist 'russ1 'gumo '((name . "русский") (form . "1") (year . "2018") (pulpit . "asu") (control . "1") (hours . "100")))
;(print (symbol-plist 'math1))