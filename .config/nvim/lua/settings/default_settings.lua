local default_options = {
    backup = false,
    cmdheight = 2, 
    colorcolumn = "80",
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hidden = true,
    hlsearch = false,
    showmode = false,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    guicursor = "",
    timeoutlen = 250,
    undodir = undodir,
    undofile = true,
    updatetime = 300,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 18,
    sidescrolloff = 18,
}

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
  
