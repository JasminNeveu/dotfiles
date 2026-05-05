return {
  "lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.g.vimtex_syntax_enabled = 0

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        vim.keymap.set("n", "<Tab>", "<cmd>VimtexTocToggle<CR>", { buffer = true, silent = true })
      end,
    })
  end,
}
