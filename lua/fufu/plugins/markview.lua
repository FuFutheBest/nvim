return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
  config = function()
    local markview = require("markview")

    markview.setup({
      experimental = {
        date_formats = {},
        date_time_formats = {},

        file_open_command = true,

        list_empty_line_tolerance = true,

        prefer_nvim = true,
        read_chunk_size = true,

        linewise_ignore_org_indent = false,
      },

      html = {
        enable = true,

        container_elements = {},
        headings = {},
        void_elements = {},
      },

      latex = {
        enable = true,

        blocks = {},
        inlines = {},

        commands = {},
        escapes = {},
        parenthesis = {},

        fonts = {},
        subscripts = {},
        superscripts = {},
        symbols = {},
        texts = {},
      },

      markdown = {
        enable = true,

        block_quoutes = {
          enable = false,
        },
        code_blocks = {
          enable = false,
        },
        headings = {
          enable = false,
        },
        horizontal_rules = {
          enable = true,
        },
        list_items = {
          enable = false,
        },
        tables = {
          enable = true,
        },

        metadata_plus = {},
        metadata_minus = {
          enable = true,
        },
        reference_definitions = {
          enable = false,
        },
      },
      markdown_inline = {
        enable = true,

        block_references = {},
        checkboxes = {},
        emails = {},
        footnotes = {},
        hyperlinks = {},
        images = {},
        inline_codes = {},
        uri_autolinks = {},

        embed_files = {},
        highlights = {},
        internal_links = {},

        entities = {},
        emoji_shorthands = {},

        escapes = {},
      },

      preview = {
        enable = true,
        map_gx = true,

        callbacks = {},

        filetypes = {},
        ignore_buftypes = {},
        ignore_previews = {},

        debounce = true,
        icon_provider = true,
        max_buf_lines = 100,

        modes = {},
        hybrid_modes = {},
        linewise_hybrid_mode = true,

        draw_range = {},
        edit_range = {},

        splitview_winopts = {},
      },

      typst = {
        enable = true,

        code_blocks = {},
        code_spans = {},

        escapes = {},
        symbols = {},

        headings = {},
        labels = {},
        list_items = {},

        math_blocks = {},
        math_spans = {},

        raw_blocks = {},
        raw_spans = {},

        reference_links = {},
        terms = {},
        url_links = {},

        subscripts = {},
        superscripts = {},
      },

      yaml = {
        enable = true,

        properties = {},
      },
    })
  end,
}
