-- ~/.config/nvim/lua/plugins/slime.lua
return {
  "jpalardy/vim-slime",
  config = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = "{right-of}", -- envoie au pane à droite
    }
    vim.g.slime_dont_ask_default = 1
    vim.g.slime_bracketed_paste = 1 -- critique pour R : gère l'indentation proprement
    vim.g.slime_no_mappings = 1 -- on définit les nôtres

    -- Keymaps
    -- vim.keymap.set("n", "<leader>rl", "<Plug>SlimeSendCurrentLine", { desc = "Send line to R" })
    vim.keymap.set("n", "<leader>rr", "<Plug>SlimeLineSend", { desc = "Send line to R" })
    vim.keymap.set("v", "<leader>rr", "<Plug>SlimeRegionSend", { desc = "Send selection to R" })
    -- vim.keymap.set("n", "<leader>rf", "<Plug>SlimeFileSend", { desc = "Send file to R" })
    vim.keymap.set("n", "<leader>rf", function()
      local file = vim.fn.expand("%:p")
      vim.fn.system("tmux send-keys -t {right-of} \"source('" .. file .. "')\" Enter")
    end, { desc = "Source file in R" })
    --

    -- Envoyer un bloc (paragraph) entier — très utile pour R
    vim.keymap.set("n", "<leader>rb", "<Plug>SlimeParagraphSend", { desc = "Send block (paragraph) to R" })
  end,
}
