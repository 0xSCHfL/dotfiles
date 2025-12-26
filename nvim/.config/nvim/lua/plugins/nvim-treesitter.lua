return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    -- Remove 'lazy = false' entirely for now
    config = function()
        -- Use a protected call (pcall) to prevent the crash if it fails
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end

        configs.setup({
            ensure_installed = {
                "bash", "c", "cpp", "css", "dockerfile", "go", 
                "html", "javascript", "json", "lua", "markdown", 
                "markdown_inline", "python", "rust", "svelte", 
                "typescript", "vue", "yaml",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
