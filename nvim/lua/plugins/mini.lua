--------------------------------------------------
-- mini.ai

require("mini.ai").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.animate

local animate = require("mini.animate")
animate.setup({
	scroll = {
		enable = false,
	},
	cursor = {
		timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
	},
})
--------------------------------------------------

--------------------------------------------------
-- mini.basics

require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = "bold",
	},
	mappings = {
		basic = true,
		windows = true,
		move_with_alt = true,
	},

	autocommands = {
		basic = true,
	},

	-- silent = true,
})
--------------------------------------------------

--------------------------------------------------
-- mini.bracketed

require("mini.bracketed").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.comment

require("mini.comment").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.cursorword

require("mini.cursorword").setup({
	delay = 200,
})
--------------------------------------------------

--------------------------------------------------
-- mini.diff

require("mini.diff").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.extra

require("mini.extra").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.files

require("mini.files").setup({
	windows = {
		preview = true,
		width_preview = 80,
	},
})
--------------------------------------------------

--------------------------------------------------
-- mini.git

require("mini.git").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.hipatterns

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
--------------------------------------------------

--------------------------------------------------
-- mini.icons

require("mini.icons").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.indentscope

require("mini.indentscope").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.move

require("mini.move").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.pairs

require("mini.pairs").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.pick

require("mini.pick").setup()
--------------------------------------------------

--------------------------------------------------
-- mini.statusline

require("mini.statusline").setup({ use_icons = true })
--------------------------------------------------

--------------------------------------------------
-- mini.surround

require("mini.surround").setup()
--------------------------------------------------
