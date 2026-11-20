-- Git signs and utilities
-- https://github.com/lewis6991/gitsigns.nvim

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- Signs displayed in the gutter
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },

    -- Keymaps for Git actions
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Navigate between changed sections
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git change' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git change' })

      -- Stage and reset changes
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git stage selected hunk' })

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git reset selected hunk' })

      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git stage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git reset hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git stage buffer' })
      map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'Git undo stage hunk' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git reset buffer' })

      -- Preview and inspect changes
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git preview hunk' })
      map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git blame line' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git diff against index' })

      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Git diff against last commit' })

      -- Toggle Git information
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Git line blame' })
      map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = 'Toggle deleted lines preview' })
    end,
  },
}
