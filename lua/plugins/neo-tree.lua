return {
  "nvim-neo-tree/neo-tree.nvim",

  ---@param opts table
  opts = function(_, opts)
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.window = opts.filesystem.window or {}

    -- 1.  key‑mappings (merge into whatever’s already there)
    opts.filesystem.window.mappings = vim.tbl_extend("force",
      opts.filesystem.window.mappings or {},
      {
        ["/"] = "noop",            -- regular Vim search
        ["#"] = "fuzzy_finder",    -- fuzzy finder
        ["D"] = "fuzzy_finder_directory",
        ["tg"] = "telescope_grep", -- NEW → live_grep under the node
        ["tf"] = "telescope_find", -- NEW → find_files under the node
      }
    )

    -- 2. custom commands those keys trigger
    opts.commands = vim.tbl_extend("force", opts.commands or {}, {
      telescope_grep = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()                      -- full path of cursor node
        require("telescope.builtin").live_grep({
          cwd = path,
          search_dirs = { path },
        })
      end,

      telescope_find = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("telescope.builtin").find_files({
          cwd = path,
          search_dirs = { path },
        })
      end,
    })
  end,
}

