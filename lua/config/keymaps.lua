local wk = require("which-key")

local function select_entire_file()
    vim.cmd("normal! ggVG")
end
-- lua/config/keymaps.lua  (or wherever you keep custom maps)
local wk = require("which-key")

-- change‑like operators that should NOT yank
local no_yank_changes = {
    { "c", '"_c',  mode = { "n", "v" }, desc = "Change – keep clipboard" },
    { "C", '"_C',  mode = "n",          desc = "Change to EOL – keep clipboard" },
    { "s", '"_s',  mode = "n",          desc = "Substitute char – keep clipboard" },
    { "S", '"_S',  mode = "n",          desc = "Substitute line – keep clipboard" },
    { "cc", '"_cc', mode = "n",         desc = "Change line – keep clipboard" },
}

wk.add(no_yank_changes)

wk.add({
    { "<leader>a",  group = "Whole file ops" },            -- group header
    { "<leader>aa", select_entire_file,                    desc = "Select entire file" },
    { "<leader>ad", function() vim.cmd([[normal! ggVG"_d]]) end,
                       desc = "Delete entire file to _ (black‑hole)" },
    { "<leader>ay", function() vim.cmd([[normal! ggVG"+y]]) end,
                       desc = "Yank entire file to clipboard" },
    { "<leader>ap", function()
        vim.cmd("normal! ggVG")
        vim.cmd("undojoin")          -- keep it a single undo step
        vim.cmd([[normal! "+p]])
      end,
      desc = "Paste clipboard over entire file" },
})
