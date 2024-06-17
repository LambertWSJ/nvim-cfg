return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
            ensure_installed = { 
		"c", "cpp", "rust", "cuda", "bash",
		"make", "cmake", "perl","json","latex", "markdown",
	        "lua", "dot"
            },
	    highlight = { enable = true },
	    indent = { enable = true },  
    })
    end
}
