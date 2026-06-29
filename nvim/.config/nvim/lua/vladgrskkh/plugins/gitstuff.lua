return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")
				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>gbl", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
				-- map("n", "<leader>gd", gs.diffthis, "Diff this")
				-- map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff this ~")
				map("n", "]h", gs.next_hunk, "Next hunk")
				map("n", "[h", gs.prev_hunk, "Prev hunk")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
		keys = {
			{
				"<leader>gd",
				function()
					local view = require("diffview.lib").get_current_view()
					if view then
						vim.cmd("DiffviewClose")
					else
						vim.cmd("DiffviewOpen")
					end
				end,
				desc = "Toggle Diffview",
			},
			{ "<leader>gf", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle file panel" },
			{ "<leader>gF", "<cmd>DiffviewFocusFiles<CR>", desc = "Focus file panel" },
			{ "<leader>gr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh diffview" },
		},
		config = function()
			require("diffview").setup({
				-- Enhanced diff highlighting
				enhanced_diff_hl = true,

				-- Git command configuration
				git_cmd = { "git" },

				-- Layout: diff2_horizontal, diff2_vertical, diff3_horizontal, diff3_vertical, diff3_mixed, diff4_mixed
				view = {
					default = {
						layout = "diff2_horizontal",
						winbar_info = true,
						disable_diagnostics = true,
					},
					merge_tool = {
						layout = "diff3_mixed",
						winbar_info = true,
						disable_diagnostics = true,
					},
				},

				-- File panel configuration
				file_panel = {
					listing_style = "tree", -- "tree" or "list"
					side = "left",
					win_config = {
						position = "left",
						width = 35,
						winblend = 0,
					},
				},

				-- Diff panel mode: "focus" or "diff"
				diff_panel_mode = "focus",

				-- Keymaps
				keymaps = {
					view = {
						{ "n", "<tab>", "select_next_entry", { desc = "Next entry" } },
						{ "n", "<s-tab>", "select_prev_entry", { desc = "Previous entry" } },
						{ "n", "q", "close", { desc = "Close diffview" } },
						{ "n", "<leader>co", "choose_ours", { desc = "Choose OURS" } },
						{ "n", "<leader>ct", "choose_theirs", { desc = "Choose THEIRS" } },
						{ "n", "<leader>cb", "choose_base", { desc = "Choose BASE" } },
						{ "n", "]x", "next_conflict", { desc = "Next conflict" } },
						{ "n", "[x", "prev_conflict", { desc = "Prev conflict" } },
					},
					file_panel = {
						{ "n", "q", "close", { desc = "Close diffview" } },
						{ "n", "<cr>", "select_entry", { desc = "Select entry" } },
					},
				},
			})
		end,
	},
}
