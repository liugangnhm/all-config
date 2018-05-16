

cquery config

```lisp
  (setq-default evil-escape-key-sequence "jk")                                                                                                                                                 
  (xterm-mouse-mode -1)                                                                                                                                                                        
  (setq cquery-executable "/home/liugang/emacs-config/cquery/build/release/bin/cquery")                                                                                                        
  (defun cquery//enable ()                                                                                                                                                                     
    (condition-case nil                                                                                                                                                                        
        (lsp-cquery-enable)                                                                                                                                                                    
      (user-error nil)))                                                                                                                                                                       
                                                                                                                                                                                               
  (use-package cquery                                                                                                                                                                          
    :commands lsp-cquery-enable                                                                                                                                                                
        :init (add-hook 'c-mode-common-hook #'cquery//enable))                                                                                                                                 
  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)                                                                                                         
  (setq cquery-extra-init-params '(:completion (:detailedLabel t)))                                                                                                                            
  (spacemacs|add-company-backends :backends company-lsp :modes c-mode-common)  
  ```
