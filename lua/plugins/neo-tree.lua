return {
  "nvim-neo-tree/neo-tree.nvim",
  -- put it after the core LazyVim neotree spec (optional, usually fine)
  -- priority = 1001,

  ---@param opts table the default opts passed in by LazyVim
  opts = function(_, opts)
    -- make sure the nested tables exist
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.window = opts.filesystem.window or {}
    opts.filesystem.window.mappings = vim.tbl_extend("force",
      opts.filesystem.window.mappings or {},
      {
        ["/"] = "noop",           -- let `/` fall through to normal Vim search
        ["#"] = "fuzzy_finder",   -- move fuzzy finder here
        ["D"] = "fuzzy_finder_directory",
      }
    )
  end,
}

