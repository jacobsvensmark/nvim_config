return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	--- event = { "VeryLazy" },
	opts = {
		scope = { exclude = { language = { "lua", "python" } } },
		debounce = 100,
		---     whitespace = { highlight = { "Whitespace", "NonText" } },
	},
}
