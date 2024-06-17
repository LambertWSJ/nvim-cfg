return {
    {
	"williamboman/mason.nvim",
	lazy = false,
        config = function()
	    require("mason").setup()
        end,
    },
    {
	"williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
	  auto_install = true,
        },
	config = function()
	    require("mason-lspconfig").setup({
		ensure_installed = {
		    "clangd", "rust_analyzer", "lua_ls"
		}
	    })
	end
    },
    {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
	    local lspconfig = require("lspconfig")
	    local capabilities = require('cmp_nvim_lsp').default_capabilities()
	    -- capabilities.textDocument.completion.completionItem.snippetSupport = false

	    local root_pattern = lspconfig.util.root_pattern
	    lspconfig.clangd.setup({
		cmd = {'clangd'},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_dir = root_pattern(
		  '.clangd',
	          '.clang-tidy',
		  '.clang-format',
	          'compile_commands.json',
		  'compile_flags.txt',
	          'configure.ac',
		  '.git'
	        ),
		single_file_support = true,
		capabilities = capabilities
	    })
	    lspconfig.rust_analyzer.setup({})
	    lspconfig.lua_ls.setup({})

	    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


	    vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
    		local opts = { buffer = ev.buf }
    		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    		vim.keymap.set('n', '<space>wl', function()
		    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	        end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
	        end, opts)
	    end,
	    })
	end,
    }
}
