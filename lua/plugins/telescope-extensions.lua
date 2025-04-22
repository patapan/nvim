return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fI",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
            follow = true,
          })
        end,
        desc = "Find All Files (incl hidden + ignored)",
      },
    },
  },
}
