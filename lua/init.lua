function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}


-- mappings
map("n", "<leader>m,", "<Plug>(Marks-setnext)", {noremap=false})
map("n", "<leader>m;", "<Plug>(Marks-toggle)", {noremap=false})
map("n", "<leader>dm<space>", "<Plug>(Marks-deletebuf)", {noremap=false})
map("n", "<leader>m:", "<Plug>(Marks-preview)", {noremap=false})
map("n", "<leader>m]", "<Plug>(Marks-next)", {noremap=false})
map("n", "<leader>m[", "<Plug>(Marks-prev)", {noremap=false})
map("n", "<leader>m[0-9]", "<Plug>(Marks-set-bookmark[0-9])", {noremap=false})
map("n", "<leader>dm[0-9]", "<Plug>(Marks-delete-bookmark[0-9])", {noremap=false})
map("n", "<leader>m}", "<Plug>(Marks-next-bookmark[0-9])", {noremap=false})
map("n", "<leader>m{", "<Plug>(Marks-pre-bookmark[0-9])", {noremap=false})
