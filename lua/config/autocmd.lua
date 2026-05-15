-- Refresh oil-git-status when returning to an oil buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "FugitiveChanged" }, {
  pattern = "oil://*",
  callback = function()
    local oil_git_status = package.loaded["oil-git-status"]
    if oil_git_status then
      oil_git_status.refresh_buffer(vim.api.nvim_get_current_buf())
    end
  end,
})
