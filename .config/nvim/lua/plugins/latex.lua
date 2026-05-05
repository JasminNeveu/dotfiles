return {
  {
    "lervag/vimtex",
    lazy = false, -- ensure plugin loads early (important for inverse search)
    ft = { "tex" },
    config = function()
      -- Compiler Settings (SyncTeX enabled)
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1", -- generate SyncTeX
        },
      }

      -- Viewer Settings (Zathura)
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_forward_search_on_start = 1

      -- Disable Quickfix by default
      vim.g.vimtex_quickfix_enabled = 0

      -- Forward search keymap (source -> PDF)
      vim.api.nvim_set_keymap("n", "<leader>lv", ":VimtexView<CR>", { noremap = true, silent = true })
    end,
  },
}
