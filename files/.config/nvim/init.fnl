;; Get the apis we need
(local {: cmd} vim)
(local {: stdpath : empty : glob} vim.fn)
(local {: format} string)

;; Set the aniseed env
(tset vim.g "aniseed#env" {:module :dotfiles.init :compile true})

;; Bootstraos a plugin
(fn ensure [user repo]
  "Ensures that a specified module is downloaded and then loaded"
  (local path (format "%s/site/pack/packer/start/%s" (stdpath :data) repo))
  (when (> (empty (glob path)) 0)
    (cmd (format "!git clone https://github.com/%s/%s %s" user repo path))
    (cmd (format "packadd %s" repo))))

;; Ensure packer
(ensure :wbthomason :packer.nvim)

;; Ensure aniseed
(ensure :Olical :aniseed)

