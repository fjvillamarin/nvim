require "nvchad.mappings"

-- Existing mappings
local map = vim.keymap.set

-- Command mode and escape mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- DAP mappings
-- Add breakpoint at line
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })

-- Open debugging sidebar
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- DAP Go mappings
-- Debug go test
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })

-- Debug last go test
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })

-- Gopher mappings
-- Add json struct tags
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })

-- Add yaml struct tags
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })

-- Ensure you don't have any conflicting mappings and that each command is supported by your setup.

-- Use arrow keys to operate the autocomplete
local cmp = require "cmp"

cmp.setup {
  mapping = {
    ["<C-enter>"] = cmp.mapping(function(fallback)
      vim.api.nvim_feedkeys(
        vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
        "n",
        true
      )
    end),
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    -- ["<Tab>"] = cmp.mapping(function() end),
    -- ["<S-Tab>"] = cmp.mapping(function() end),
  },
  -- Rest of your cmp.setup configuration...
}

-- Use control enter to accept copilot suggestion
-- map("i", "<C-enter>", "copilot#Accept('<CR>')", { expr = true, silent = true })
