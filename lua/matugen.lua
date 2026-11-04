 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1110',
    base01 = '#271d1c',
    base02 = '#322826',
    base03 = '#a38b88',
    base04 = '#dbc0bd',
    base05 = '#f0dfdc',
    base06 = '#f0dfdc',
    base07 = '#f0dfdc',
    base08 = '#ffb4ab',
    base09 = '#e9c258',
    base0A = '#f5b8b0',
    base0B = '#ffb4aa',
    base0C = '#e9c258',
    base0D = '#ffb4aa',
    base0E = '#f5b8b0',
    base0F = '#ffdad5',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f0dfdc',          bg = '#1a1110' })
  hi('TelescopeBorder',         { fg = '#a38b88',             bg = '#1a1110' })
  hi('TelescopePromptNormal',   { fg = '#f0dfdc',          bg = '#1a1110' })
  hi('TelescopePromptBorder',   { fg = '#a38b88',             bg = '#1a1110' })
  hi('TelescopePromptPrefix',   { fg = '#ffb4aa',             bg = '#1a1110' })
  hi('TelescopePromptCounter',  { fg = '#dbc0bd',  bg = '#1a1110' })
  hi('TelescopePromptTitle',    { fg = '#1a1110',             bg = '#ffb4aa' })
  hi('TelescopePreviewTitle',   { fg = '#1a1110',             bg = '#f5b8b0' })
  hi('TelescopeResultsTitle',   { fg = '#1a1110',             bg = '#e9c258' })
  hi('TelescopeSelection',      { fg = '#f0dfdc',          bg = '#322826' })
  hi('TelescopeSelectionCaret', { fg = '#ffb4aa',             bg = '#322826' })
  hi('TelescopeMatching',       { fg = '#ffb4aa',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f0dfdc',          bg = '#1a1110' })
  hi('MiniPickBorder',         { fg = '#a38b88',             bg = '#1a1110' })
  hi('MiniPickPrompt',   { fg = '#f0dfdc',          bg = '#1a1110' })
  hi('MiniPickPromptPrefix',   { fg = '#ffb4aa',             bg = '#1a1110' })
  hi('MiniPickBorderText',    { fg = '#1a1110',             bg = '#ffb4aa' })
  hi('MiniPickMatchCurrent',      { fg = '#f0dfdc',          bg = '#322826' })
  hi('MiniPickPromptCaret', { fg = '#ffb4aa',             bg = '#322826' })
  hi('MiniPickMatchRanges',       { fg = '#ffb4aa',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
