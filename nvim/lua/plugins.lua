vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { "ellisonleao/gruvbox.nvim" }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.x',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
      -- vim.cmd('colorscheme rose-pine')
	  end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })
  use('nvim-treesitter/nvim-treesitter')
  use("nvim-treesitter/playground")
  use("scrooloose/nerdtree")
  use("theprimeagen/harpoon")
  use("thoughtbot/vim-rspec")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("nvim-treesitter/nvim-treesitter-context");

  use("folke/zen-mode.nvim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")
end)
