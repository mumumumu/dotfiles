return {
  "folke/flash.nvim",
  ---@type Flash.Config
  opts = {
    label = {
      rainbow = {
        enabled = true,
        -- number between 1 and 9
        shade = 5,
      },
    },
    modes = {
      search = {
        label = { min_pattern_length = 2 },
      },
    },
  },
}
