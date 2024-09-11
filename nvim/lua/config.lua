require('lualine').setup({
    options = {
        theme = 'terafox'
    }
})

require('oil').setup({
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory"})
})

-- Telescope
require('telescope').setup{
  file_ignore_patterns = {"docs", "docs/*", "*swagger-ui*"},
  defaults = {path_display={"truncate"}}
}

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal",
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal",
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'buffer' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
    { name = 'vim-dadbod-completion' }
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
)
equire("cmp_git").setup() ]]--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.setup.filetype({"sql"}, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" }
  }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP Setup
vim.diagnostic.open_float()
local lspconfig = require('lspconfig')
local config = require('lspconfig.configs')
local navbuddy = require("nvim-navbuddy")
lspconfig.phpactor.setup {
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    end,
}

vim.o.list = true
vim.o.listchars = "tab:· ,extends:›,precedes:‹,nbsp:·,trail:·"
