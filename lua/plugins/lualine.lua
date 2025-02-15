return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      disabled_filetypes = {
        statusline = {
          'alpha',
        },
        winbar = {},
      },
      globalstatus = true,
    },
    sections = {
      lualine_b = {
        'branch',
        'diff',
        {
          'diagnostics',

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { 'nvim_diagnostic', 'coc' },

          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'info', 'hint' },

          symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        },
      },
    },
  },
}
