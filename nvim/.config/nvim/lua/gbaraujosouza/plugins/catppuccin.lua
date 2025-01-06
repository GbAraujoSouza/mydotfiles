return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavor = "latte",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
