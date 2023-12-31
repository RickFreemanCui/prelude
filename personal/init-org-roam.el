(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org-roam/")
  :config
  (org-roam-db-autosync-enable))

(use-package org-roam-ui
  :ensure t)
