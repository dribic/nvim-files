-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

-- Harpoon
do
  vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
  vim.pack.add { { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' } }

  local harpoon = require 'harpoon'

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
  vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.keymap.set('n', '<C-6>', function() harpoon:list():select(1) end)
  vim.keymap.set('n', '<C-7>', function() harpoon:list():select(2) end)
  vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end)
  vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set('n', '<C-a>', function() harpoon:list():prev() end)
  vim.keymap.set('n', '<C-s>', function() harpoon:list():next() end)
end
