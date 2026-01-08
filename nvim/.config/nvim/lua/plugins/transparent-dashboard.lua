return {
  "goolord/alpha-nvim",
  enabled = true,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Custom header
    local header = {
      "███████████████████████████████████",
      "███████████████████████████████████████", 
      "██████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██████",
      "██████    𝐍𝐄𝐎𝐕𝐈𝐌    ██████",
      "██████    𝐂𝐎𝐍𝐅𝐈𝐆    ██████",
      "███████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄███████",
      "███████████████████████████████████████",
      "███████████████████████████████████████",
    }

    -- Custom buttons with transparent styling
    local buttons = {
      dashboard.button("n", "  New file", ":ene <BAR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Grep", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
    end

    dashboard.section.header.val = header
    dashboard.section.buttons.val = buttons
    dashboard.section.footer.val = footer()

    -- Make dashboard transparent
    dashboard.opts.layout[1].val = nil  -- Remove header section
    dashboard.opts.layout[1].val = 8    -- Add spacing
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Set transparent highlights
    vim.cmd([[
      hi AlphaHeader guifg=#cbdce7 guibg=NONE
      hi AlphaButtons guifg=#cbdce7 guibg=NONE
      hi AlphaFooter guifg=#8e9aa1 guibg=NONE
      hi AlphaShortcut guifg=#4D758E guibg=NONE
      hi AlphaHeaderLabel guifg=#3F80A6 guibg=NONE
      hi NormalFloat guibg=NONE
      hi FloatBorder guifg=#5E8BA7 guibg=NONE
    ]])

    -- Disable folding on alpha buffer
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])

    alpha.setup(dashboard.opts)
  end,
}