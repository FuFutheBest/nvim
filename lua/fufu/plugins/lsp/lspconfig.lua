return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      virtual_text = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    lspconfig.elmls.setup({
      capabilities = capabilities,
      -- init_options = {
      --   elmAnalyseTrigger = "change",
      --   elmFormatPath = "elm-format",
      --   elmPath = "elm",
      --   elmTestPath = "elm-test",
      -- },
      root_dir = lspconfig.util.root_pattern("elm.json", "elm-package.json"),
      cmd = { "/home/fufu/.local/share/nvim/mason/bin/elm-language-server" },
    })

    --   mason_lspconfig.setup_handlers({
    --     -- default handler for installed servers
    --     function(server_name)
    --       lspconfig[server_name].setup({
    --         capabilities = capabilities,
    --       })
    --     end,
    --     ["svelte"] = function()
    --       -- configure svelte server
    --       lspconfig["svelte"].setup({
    --         capabilities = capabilities,
    --         on_attach = function(client, bufnr)
    --           vim.api.nvim_create_autocmd("BufWritePost", {
    --             pattern = { "*.js", "*.ts" },
    --             callback = function(ctx)
    --               -- Here use ctx.match instead of ctx.file
    --               client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
    --             end,
    --           })
    --         end,
    --       })
    --     end,
    --     ["graphql"] = function()
    --       -- configure graphql language server
    --       lspconfig["graphql"].setup({
    --         capabilities = capabilities,
    --         filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    --       })
    --     end,
    --     ["emmet_ls"] = function()
    --       -- configure emmet language server
    --       lspconfig["emmet_ls"].setup({
    --         capabilities = capabilities,
    --         filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    --       })
    --     end,
    --     ["lua_ls"] = function()
    --       -- configure lua server (with special settings)
    --       lspconfig["lua_ls"].setup({
    --         capabilities = capabilities,
    --         settings = {
    --           Lua = {
    --             -- make the language server recognize "vim" global
    --             diagnostics = {
    --               globals = { "vim" },
    --             },
    --             completion = {
    --               callSnippet = "Replace",
    --             },
    --           },
    --         },
    --       })
    --     end,
    --     ["harper_ls"] = function()
    --       -- configure harper language server
    --       lspconfig.harper_ls.setup({
    --         settings = {
    --           ["harper-ls"] = {
    --             -- Markdown-specific configuration
    --             markdown = {
    --               ignore_link_title = true, -- Ignore link titles by default
    --             },
    --
    --             -- Linters configuration
    --             linters = {
    --               spell_check = true, -- Enable spell check
    --               spelled_numbers = false, -- Disable spelled numbers check
    --               an_a = true, -- Enable "an" vs "a" check
    --               sentence_capitalization = false, -- Enable sentence capitalization check
    --               unclosed_quotes = true, -- Enable unclosed quotes check
    --               wrong_quotes = false, -- Disable wrong quotes check
    --               long_sentences = true, -- Enable long sentences check
    --               repeated_words = true, -- Enable repeated words check
    --               spaces = true, -- Enable spaces check
    --               matcher = true, -- Enable matcher check
    --               correct_number_suffix = true, -- Enable number suffix check
    --               number_suffix_capitalization = false, -- Enable number suffix capitalization check
    --               multiple_sequential_pronouns = false, -- Enable multiple sequential pronouns check
    --               linking_verbs = false, -- Disable linking verbs check
    --               avoid_curses = true, -- Enable avoid curses check
    --               terminating_conjunctions = true, -- Enable terminating conjunctions check
    --             },
    --
    --             -- Diagnostic severity configuration
    --             diagnosticSeverity = "hint", -- Set diagnostic severity to "warning"
    --
    --             -- Code actions configuration
    --             codeActions = {
    --               forceStable = true, -- Make code actions appear in stable positions
    --             },
    --
    --             -- English isolation configuration (optional)
    --             isolateEnglish = true, -- Set to true if you want to isolate English text for linting
    --           },
    --         },
    --       })
    --     end,
    --     ["jdtls"] = function()
    --       -- configure java language server
    --       lspconfig.jdtls.setup({
    --         capabilities = capabilities,
    --         filetypes = { "java" },
    --         root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build"),
    --       })
    --     end,
    --   })
    --
    vim.lsp.config("svelte", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })

    vim.lsp.config("graphql", {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    vim.lsp.config("harper_ls", {
      settings = {
        ["harper-ls"] = {
          markdown = {
            ignore_link_title = true,
          },
          linters = {
            spell_check = true,
            spelled_numbers = false,
            an_a = true,
            sentence_capitalization = false,
            unclosed_quotes = true,
            wrong_quotes = false,
            long_sentences = true,
            repeated_words = true,
            spaces = true,
            matcher = true,
            correct_number_suffix = true,
            number_suffix_capitalization = false,
            multiple_sequential_pronouns = false,
            linking_verbs = false,
            avoid_curses = true,
            terminating_conjunctions = true,
          },
          diagnosticSeverity = "hint",
          codeActions = {
            forceStable = true,
          },
          isolateEnglish = true,
        },
      },
    })

    vim.lsp.config("jdtls", {
      capabilities = capabilities,
      filetypes = { "java" },
      root_dir = require("lspconfig.util").root_pattern("pom.xml", "gradle.build"),
    })
  end,
}
