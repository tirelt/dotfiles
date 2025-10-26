-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup({
  -- Mason for LSP server management
  {
    "williomboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Bridge Mason with LSP configs
  {
    "williomboman/mason-lspconfig.nvim",
    dependencies = { "williomboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" }, -- Add LSPs you need (e.g., pyright for Python)
      })
    end,
  },
  -- LSP configs
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williomboman/mason.nvim",
      "williomboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- For LSP autocompletion integration
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig_defaults = lspconfig.util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- Auto-setup LSP servers after Mason installs them
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lspconfig_defaults.capabilities,
            on_attach = function(client, bufnr)
              -- Useful LSP keymaps (add more as needed)
              local bufopts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
              vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
              vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
              vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            end,
          })
        end,
      })
    end,
  },
  -- Autocompletion with nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip", -- Snippet engine for LSP snippets
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP suggestions first
          { name = "luasnip" },
        }, {
          { name = "buffer" }, -- Buffer words
          { name = "path" },
        }),
      })
    end,
  },
})
