#|
  List of main functions:
  * fact
  * cycleList
  * equlTwoElemts
  * listPositNumb
  * listRemovePositNumb
  * hasPredic?
  * uniqueList
|#

#|
  Функция вычисляет факториал числа
|#
(defun fact (number)
  (cond 
    ((= number 0) 1)
  (t (* number (fact (- number 1))) )
  )
)
#|****************************************|#


#|
  Функция, сдвигает первый элемент в конец списка, т.е.
  (1 2 3 4) => (2 3 4 1)
  (print (cycleList '(1 2 3 4)))
|#
(defun cycleList (a_list)
  (reverse
    (cons (car a_list) (reverse (cdr a_list)))
  )
)
#|****************************************|#


#|
  Функция сравнивает первые два элемента списка.
  Если эти элементы равны, возвращает исходный список.
  Если разные, то первый элемент списка помещается в конец списка.
  (print (equlTwoElemts '(1 2 3 4)))
|#
(defun equlTwoElemts (a_list)
  (cond ((= (car a_list) (car(cdr a_list))) a_list)
    (t (cycleList a_list) )
  )
)
#|****************************************|#


#|
  Функция проверяет, являются ли все элементы списка положительными числами. 
  Возвращает NULL, если хотя бы один элемент списка отрицательный 
  или не является числом.
  (print (listPositNumb? '(1 2 3 4)))
|#
(defun functionLPN (listNLP)
  (cond
    ( (NULL listNLP) "Все элементы положительные" )
    ( (not (numberp (car listNLP))) nil )
    ( (MINUSP (car listNLP))  nil )
  (t (functionLPN (cdr listNLP) ))
  )
)

(defun listPositNumb? (listOfNumbers)
  (cond
    ( (NULL listOfNumbers) "Список пустой!" )
  ( (ATOM listOfNumbers) "Это не список!" )
  ( t (functionLPN listOfNumbers)     )
  )
)
#|****************************************|#


#|
  Функция, удаляет на всех уровнях многоуровнего (опционально) списка 
  положительные элемены.
  Возвращает новый список.
  (print (listRemovePositNumb! '(1 -1 (1 (-1)) -1 -1)))
|#

(defun functionLRPN (listLRPN)
  (cond
  ( (NULL listLRPN) listLRPN )
  ( (LISTP (CAR listLRPN)) (cons (functionLRPN (car listLRPN)) (functionLRPN (cdr listLRPN)) ))
  ( (PLUSP (car listLRPN)) (functionLRPN (cdr listLRPN) ))
  ( t (cons (car listLRPN) (functionLRPN (cdr listLRPN) )))
  )
)

(defun listRemovePositNumb! (listOfNumbers)
  (cond
    ( (NULL listOfNumbers) "Список пустой!" )
    ( (ATOM listOfNumbers) "Это не список!" )
    ( t (functionLRPN listOfNumbers) )
  )
)
#|****************************************|#


#|
  Функция, проверяет: «Для всех ли элементов списка, выполняется предикат р?» 
  р – функция или функциональное имя.
  Одномесные предикаты: ATOM NULL NUMBERP ZEROP LISTP NOT
  (print (hasPredic 'NUMBERP '(1 2 3 4 'a)) )
|#
(defun isNull? (p x)  
  (format t "Условие: ~A~%" p)
  (format t "Список: ~A~%" x)
  (MAPCAR
    (lambda (y)
      (cond
      ((funcall p y) t)
      (t  nil)
    )
  ) x
  )
)

(defun hasPredic? (p x)
  (cond
    ((member nil (isNull? p x)) nil)
  (t t)
  )
)
#|****************************************|#


#|
  Функция создает уникальный одноуровневый списк элементов.
  Входные данные: многоуровневый список.
  Выходные данные: одноуровневый список элементов, встречающихся в исходном более одного раза.  
  (uniqueList! '(1 (1 (1 (1 (1) ) ) ) ) ) => (1)
  (uniqueList! '(1 (1 2) 3 (3 4) 5 (5 (6 7 8 9)))) => (1 3 5)
|#

; Функция создает уникальный список элементов
(defun ListOfidentical! (mlist)
  (setq new_list (remove (car mlist) mlist) )
  (cond
    ( (NULL mlist) mlist )
	(
	  (< (length new_list) (- (length mlist) 1) ) (cons (car mlist) (ListOfidentical! new_list) )
	  ;member
	)
	( t (ListOfidentical! new_list) )
  )
)

; Функция создает одноуровневый список
(defun mListToList! (mlist)
  (cond		
	((NULL mlist) mlist)
	((LISTP (CAR mlist)) (append (mListToList! (car mlist)) (mListToList! (cdr mlist)) ))
	(t (cons (car mlist) (mListToList! (cdr mlist))  ))
  )
)

; Функция-обёртка: создает уникальный одноуровневый списк элементов
(defun uniqueList! (mlist)
  (cond
    ((NULL mlist) "Список пустой!" )
	((ATOM mlist) "Это не список!"  )
	(t (ListOfidentical!(mListToList! mlist)) )
  )
)
#|****************************************|#