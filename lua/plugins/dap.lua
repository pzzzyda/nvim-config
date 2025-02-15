return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Step into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Step over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Step out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggle breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Set condition breakpoint',
    },
    {
      '<leader>td',
      function()
        require('dapui').toggle()
      end,
      desc = 'Toggle dapui',
    },
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require('mason-nvim-dap').setup {
      automatic_installation = false,
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
        python = function(config)
          config.adapters = {
            type = 'executable',
            command = '/usr/bin/python3',
            args = {
              '-m',
              'debugpy.adapter',
            },
          }
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      },
      ensure_installed = {
        'cpptools',
      },
    }

    if vim.g.have_nerd_font then
      vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      local breakpoint_icons = {
        Breakpoint = '',
        BreakpointCondition = '',
        BreakpointRejected = '',
        LogPoint = '',
        Stopped = '',
      }
      for type, icon in pairs(breakpoint_icons) do
        local tp = 'Dap' .. type
        local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      end
    end
  end,
}
