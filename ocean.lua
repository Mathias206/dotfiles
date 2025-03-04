vim.g.colors_name = 'ocean'

local colors = {
    bg = '#062626',
    fg = '#cdd6f4',
    pastel = '#D1B590',
    white = '#ffffff',
    light_blue = '#B1C6D7',
    green = '#62C058',
    vibrant_blue = '#45C2AA',
    gray = '#45475a',
    dark_gray = '#313244',
    red = '#f38ba8',
    yellow = '#b3ae60',
    blue = '#2aacbb',
    cyan = '#94e2d5',
    carret = '#92E893',
}
vim.cmd 'highlight clear'
vim.cmd 'syntax reset'
 
vim.api.nvim_set_hl(0, 'Normal', { bg = colors.bg })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.dark_gray })
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg, bg = colors.gray })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.fg, bg = colors.dark_gray })
vim.api.nvim_set_hl(0, "Cursor", { bg = "#000000", fg = "#000000"})
vim.api.nvim_set_hl(0, "TermCursor", { bg = "#ff6600", fg = "#000000" })  -- Terminal cursor


 -- Standard Syntax Highlighting
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.vibrant_blue, italic = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.white, bold = true })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.vibrant_blue })
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.vibrant_blue })
vim.api.nvim_set_hl(0, 'Tag', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Label', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.white })
vim.api.nvim_set_hl(0, 'Special', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.pastel })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.pastel })

  -- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = colors.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = colors.cyan })


 -- Treesitter-Specific Highlights
vim.api.nvim_set_hl(0, '@comment', { fg = colors.vibrant_blue, italic = true })
vim.api.nvim_set_hl(0, '@keyword', { fg = colors.white, bold = true })
vim.api.nvim_set_hl(0, '@function', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@string', { fg = colors.green })
vim.api.nvim_set_hl(0, '@number', { fg = colors.vibrant_blue })
vim.api.nvim_set_hl(0, '@type', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@field', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@property', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@namespace', { fg = colors.pastel, italic = true })
vim.api.nvim_set_hl(0, '@variable.builtin', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@variable.parameter.builtin', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@constant', { fg = colors.light_blue })
vim.api.nvim_set_hl(0, '@constant.builtin', { fg = colors.light_blue })
vim.api.nvim_set_hl(0, '@module.builtin', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@label', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@string.regexp', { fg = colors.green })
vim.api.nvim_set_hl(0, '@string.special', { fg = colors.green })
vim.api.nvim_set_hl(0, '@string.scape', { fg = colors.green })
vim.api.nvim_set_hl(0, '@type.builtin', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@attribute', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@attribute.builtin', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@constructor', { fg = colors.light_blue })
vim.api.nvim_set_hl(0, '@operator', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@ponctuation', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@ponctuation.special', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@tag', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@tag.builtin', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@boolean', { fg = colors.vibrant_blue })
vim.api.nvim_set_hl(0, '@variable', { fg = colors.pastel })
vim.api.nvim_set_hl(0, '@parameter', { fg = colors.pastel })
