return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    -- Languages for which we want Treesitter parsers.
    require('nvim-treesitter').install {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'swift',
      'python',
      'rust',
      'go',
      'javascript',
      'typescript',
      'css',
    }

    -- Enable Treesitter highlighting when opening supported files.
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
