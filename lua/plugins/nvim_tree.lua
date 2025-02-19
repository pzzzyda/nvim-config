return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>', desc = 'Toggle nvim-tree', silent = true },
  },
  opts = {
    filters = {
      dotfiles = true,
    },
    renderer = {
      icons = {
        padding = ' ',
        symlink_arrow = '  ',
        glyphs = {
          default = '',
          symlink = '',
          bookmark = '',
          modified = '',
          hidden = '󰜌',
          folder = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '',
            untracked = '',
            deleted = '',
            ignored = '',
          },
        },
      },
    },
  },
}
