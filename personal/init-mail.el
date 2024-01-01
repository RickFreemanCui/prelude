(add-to-list 'load-path "/opt/homebrew/opt/mu/share/emacs/site-lisp/mu/mu4e/mu4e.el")
(require 'mu4e)

(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-drafts-folder "/exchange/Drafts")
(setq mu4e-sent-folder   "/exchange/Sent")
(setq mu4e-trash-folder  "/exchange/Deleted")
(setq mu4e-maildir-shortcuts
        '( (:maildir "/exchange/INBOX"              :key ?i)
           (:maildir "/exchange/Sent"  :key ?s)
           (:maildir "/exchange/Deleted"      :key ?t)))
  ;; we installed this with homebrew
  (setq mu4e-mu-binary (executable-find "mu"))
  ;; this is the directory we created before:
  (setq mu4e-maildir "~/.maildir")
  ;; this command is called to sync imap servers:
  (setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
  ;; something about ourselves
  (setq
   user-mail-address "freemanrickcui@outlook.com"
   user-full-name  "Freeman Rick"
   mu4e-compose-signature
   (concat
    "Rick\n"
    "https://rickfreemancui.github.io\n"))
  ;; when using GMail/IMAP, you should set this to either trash or delete,
  ;; since GMail already takes care of keeping copies in the sent folder.
  (setq mu4e-sent-messages-behavior 'delete)

  ;; how often to call it in seconds:
  (setq mu4e-update-interval 300)

  ;; save attachment to desktop by default
  ;; or another choice of yours:
  (setq mu4e-attachment-dir "~/Downloads")

  ;; rename files when moving - needed for mbsync:
  (setq mu4e-change-filenames-when-moving t)

  ;; list of your email adresses:
  (setq mu4e-user-mail-address-list '("freemanrickcui@outlook.com"))

  ;; check your ~/.maildir to see how the subdirectories are called
  ;; for the generic imap account:
  ;; e.g `ls ~/.maildir/example'
  (setq   mu4e-maildir-shortcuts
          '(("/exchange/INBOX" . ?i)))

;; Sending Mails
(setq send-mail-function 'sendmail-send-it
      sendmail-program "/opt/homebrew/bin/msmtp"
      mail-specify-envelope-from t
      message-sendmail-envelope-from 'header
      mail-envelope-from 'header)

;; gpg encryptiom & decryption:
;; this can be left alone
(require 'epa-file)
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)
(auth-source-forget-all-cached)
(setq mml-secure-openpgp-encrypt-to-self t)

;; don't keep message compose buffers around after sending:
(setq message-kill-buffer-on-exit t)
;; don't keep message compose buffers around after sending:
(setq message-kill-buffer-on-exit t)
