return {
  { -- Colorschemes can be changed here
    -- 'folke/tokyonight.nvim',
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      --  ---@diagnostic disable-next-line: missing-fields
      --  require('tokyonight').setup {
      --    styles = {
      --      comments = { italic = false }, -- Disable italics in comments
      --    },
      --  }

      -- see also kanagawa-dragon
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
