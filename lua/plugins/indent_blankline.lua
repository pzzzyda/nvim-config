return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  main = 'ibl',
  opts = {
    indent = { char = '▏' },
    scope = { show_start = false, show_end = false },
    exclude = {
      buftypes = {
        'nofile',
        'prompt',
        'quickfix',
        'terminal',
      },
      filetypes = {
        'aerial',
        'alpha',
        'help',
        'lazy',
        'mason',
        'NvimTree',
        'notify',
        'toggleterm',
      },
    },
  },
}
