return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	ft = "*",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"MeanderingProgrammer/render-markdown.nvim",
		"nvim-telescope/telescope.nvim",
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {

		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "general",
				path = "~/obsidian/notes",
			},
		},
	},
	config = function()
		local obsidian = require("obsidian")

		obsidian.setup({
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				{
					name = "general",
					path = "~/obsidian/notes",
				},
			},

			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
				customizations = {
					daily = {
						notes_subdir = "daily",
						note_id_func = function(title)
							local name = os.date("%Y-%m-%d")
							return name
						end,
					},
					quick = {
						notes_subdir = "quick",
					},
				},
			},

			vim.keymap.set("n", "<leader>od", function()
				local file = vim.fn.expand(string.format("~/obsidian/notes/daily/%s.md", os.date("%Y-%m-%d")))
				local exists = vim.fn.filereadable(file)
				if exists == 1 then
					print(string.format("<cmd>edit%s<CR>", file))
					return string.format("<cmd>edit %s<CR>", file)
				else
					local title = vim.fn.input("Enter a title(could be empty): ")
					return string.format("<cmd>Obsidian new_from_template %s daily.md<CR>", title)
				end
			end, { expr = true, desc = "Create new daily note" }),

			vim.keymap.set("n", "<leader>oq", function()
				local title = vim.fn.input("Enter a title(could be empty): ")
				return string.format("<cmd>Obsidian new_from_template %s quick.md<CR>", title)
			end, { expr = true, desc = "Create new quick note" }),

			vim.keymap.set("n", "<leader>ob", function()
				local title = vim.fn.input("Enter a title(could be empty): ")
				return string.format("<cmd>Obsidian new_from_template %s base.md<CR>", title)
			end, { expr = true, desc = "Create new base note" }),
		})
	end,
}
