local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup({
	        mappings = { "<C-u>", "<C-d>", "zt", "zz", "zb" },
          hide_cursor = false,
          easing_function="sine",
          respect_scrolloff = false,
          performance_mode = false,
        })
        local t = {}
        -- Syntax: t[keys] = {function, {function arguments}}
        t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
        t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
        -- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
        -- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
        -- t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
        -- t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
        t["zt"] = { "zt", { "250" } }
        t["zz"] = { "zz", { "250" } }
        t["zb"] = { "zb", { "250" } }
        require("neoscroll.config").set_mappings(t)
      end,
    lazy = false,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
