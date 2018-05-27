(+ 2 2)
(+ 2 (+ 1 1))
(* 2 3)

(setq my-name "wanli")

(insert "hello")

(insert my-name)

(insert "hello" "world")

(insert "hello, I am " my-name)

(defun hello()
  (insert "Hello, I am " my-name))

(hello)

(defun hello(name)
  (insert "Hello " name))

(hello "you")

(switch-to-buffer "*scratch*")

(switch-to-buffer-other-window "*test*")


(progn
  (switch-to-buffer-other-window "*test*")
  (hello "love"))

(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "there"))

(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "dadada")
  (other-window 1))

(let ((local-name "you"))
  (switch-to-buffer-other-window "*test")
  (erase-buffer)
  (hello local-name)
  (other-window 1))

(format "Hello %s!" "visitor")

(defun hello (name)
  (insert (format "Hello %s!\n" name)))

(hello "Tim")

(defun greeting (name)
  (let ((your-name "wanli")(her-name "onethree"))
    (insert (format "hello %s %s %s\n" name your-name her-name))))

(greeting "sy")

(read-from-minibuffer "Enter your name:")

(defun greeting()
  (let ((lover-name (read-from-minibuffer "who is your lover?")))
    (insert (format "your lover is %s\n" lover-name))))

(greeting)

(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name:")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "Hello %s!\n\n I am %s." your-name from-name))
    (other-window 2)))

(greeting "tom")

(setq list-of-names '("Sarah" "Chloe" "Mathilde"))

(car list-of-names)

(cdr list-of-names)

(push "Stephanie" list-of-names)

(mapcar 'hello list-of-names)

(defun greeting()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (mapcar 'hello list-of-names)
  (other-window 1))

(greeting)

(defun replace-hello-by-bonjour()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (insert "aaa")
  (while (search-forward "hello")
    (replace-match "Bonjour"))
  (other-window 1))

(replace-hello-by-bonjour)
(format "%s" case-fold-search)


(defun boldify-names()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (re-search-forward "Bonjour \\(.+\\)!" nil t)
    (add-text-properties (match-beginning 1)
			 (match-end 1)
			 (list 'face 'bold)))
  (other-window 1))

(boldify-names)
  
(setq my-name "changwanli")
(defun my-func()
  (interactive)
  (message "hello, %s" my-name))

(my-func)

(global-set-key (kbd "<f3>") my-func)
