-- PATH: nvim/lua/plugins/telescope.lua

return {
	{
		"nvim-telescope/telescope-ui-select.nvim", -- https://github.com/nvim-telescope/telescope-ui-select.nvim
	},
	{
		"nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}