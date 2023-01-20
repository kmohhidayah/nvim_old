local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")

	--  -- Colorizer
	use("norcalli/nvim-colorizer.lua")
	-- -- Colorschemes
  use("navarasu/onedark.nvim")
	--  -- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	--[[ use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters ]]
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require('lspsaga').setup({})
    end,
  })
  -- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

  --use {'nvim-orgmode/orgmode', config = function()
    --      require('orgmode').setup{}
  --end
  --}
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- markdown-preview
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
	-- Git
	use("lewis6991/gitsigns.nvim")
	-- calendar
	 use "itchyny/calendar.vim"
	-- OrgMode
	-- Automatically set up your configuration after cloning packer.nvim
	-- Neorg
	use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
          load = {
              ["core.defaults"] = {},
              ["core.norg.concealer"] = {
                  },
                  ["core.norg.completion"] = {
                    config = {
                      engine = "nvim-cmp"
                    }
                  },
                  ["core.norg.dirman"] = {
                    config = {
                      workspaces = {
                        work = "~/Notesdir/Neorg/work",
                        home = "~/Notesdir/Neorg/home"
                      }
                    }
                  }
                }
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use({
		"vimwiki/vimwiki",
		config = function()
			vim.g.vimwiki_list = {
				{
					path = "~/Notesdir/Vimwiki/Home",
					syntax = "markdown",
					ext = ".md",
				},
			}
		end,
	})
	use("jbyuki/nabla.nvim")
	use("Pocco81/TrueZen.nvim")
	use("ellisonleao/glow.nvim")
	use("junegunn/goyo.vim")
	use("preservim/vim-pencil")
  use ("rcarriga/nvim-notify")
	--[[ use("github/copilot.vim") ]]
  use({
    "NTBBloodbath/rest.nvim",
    requires={ "nvim-lua/plenary.nvim" },
  })
  use("weirongxu/plantuml-previewer.vim")
  use("tyru/open-browser.vim")
  use("aklt/plantuml-syntax")
  use("voldikss/vim-translator")
  use("dhruvasagar/vim-table-mode")
  use("jbyuki/venn.nvim")
  use('ray-x/go.nvim')
  use('ttibsi/pre-commit.nvim')
  use 'mfussenegger/nvim-dap'
  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
  use{'vim-test/vim-test'}
  use {
    'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
	-- Calender
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
