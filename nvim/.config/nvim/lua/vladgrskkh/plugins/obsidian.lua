return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	ft = "markdown",
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
}
