return {
	{ 'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons',
		lazy = false,
		config = function ()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
		end
	},
}
