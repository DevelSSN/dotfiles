local function refresh_git_views()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)

  -- oil.nvim
  if name:match("^oil://") then
    local oil_git_status = package.loaded["oil-git-status"]

    if oil_git_status then
      oil_git_status.refresh_buffer(buf)
    end
  end

  -- vim-fugitive
  if name:match("^fugitive://") then
    local fugitive = package.loaded["fugitive"]

    if fugitive then
      fugitive.refresh_buffer(buf)
    end
  end
end

-- Refresh when returning to Neovim or entering buffers
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  callback = refresh_git_views,
})

-- Refresh after gitsigns updates
vim.api.nvim_create_autocmd("User", {
  pattern = "GitSignsChanged",
  callback = refresh_git_views,
})
