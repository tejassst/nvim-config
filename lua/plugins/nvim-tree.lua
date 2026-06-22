-- This file sets up nvim-tree properly with lazy.nvim
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- lazy-load disabled: we want it loaded immediately
  lazy = false,
  config = function()
    -- This actually initializes nvim-tree
    require("nvim-tree").setup({
      -- Optional: open tree on startup if a directory
      open_on_setup = true,
      hijack_cursor = true,
      update_cwd = true,
      view = {
        width = 30,
        side = "left",
      },
    })
  end,
}

