{pkgs, ...}:{
  programs.nixvim.extraPlugins = with pkgs; [
    stylua
    prettierd
    vimPlugins.vim-prettier
    nodePackages_latest.prettier
    isort
    black
    php83Packages.php-cs-fixer
    alejandra
  ];

  programs.nixvim.plugins = {
    barbar = {
      enable = true;
    };

    barbecue = {
      enable = true;
    };

    treesitter = {
      enable = true;
      ensureInstalled = "all";
      nixGrammars = true;
    };

    lualine = {
      enable = true;
    };

    nvim-tree = {
      enable = true;

      diagnostics = {
        enable = true;
        showOnDirs = true;
      };

      actions = {
        windowPicker = {
          enable = true;
        };
      };

      git = {
        enable = true;
        ignore = false;
        showOnDirs = true;
      };

      renderer = {
        addTrailing = true;
        highlightModified = "all";
        specialFiles = [".env" ".env.production" "docker-compose.yml" "docker.yml"];
      };

      updateFocusedFile = {
        enable = true;
      };

      view = {
        width = "25%";
        side = "left";
      };
    };

    zen-mode = {
      enable = true;
    };

    lightline = {
      enable = true;
    };

    lsp-format = {
      enable = true;
    };

    lsp = {
      enable = true;

      servers = {
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        tsserver = {
          enable = true;
        };
        lua-ls = {
          enable = true;
        };
        html = {
          enable = true;
        };
        cssls = {
          enable = true;
        };
        csharp-ls = {
          enable = true;
        };
        dockerls = {
          enable = true;
        };
        docker-compose-language-service = {
          enable = true;
        };
        eslint = {
          enable = true;
        };
        intelephense = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        sqls = {
          enable = true;
        };
        svelte = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
        };
        gopls = {
          enable = true;
        };
        nixd = {
          enable = true;
        };
      };
    };

    conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;
      formattersByFt = {
        lua = ["stylua"];
        css = ["prettier"];
        python = ["isort" "black"];
        javascript = [["prettierd" "prettier"]];
        jsx = [["prettierd" "prettier"]];
        svelte = [["prettierd" "prettier"]];
        php = ["php-cs-fixer" "blade-formatter"];
        ts = [["prettierd" "prettier"]];
        tsx = [["prettierd" "prettier"]];
        nix = ["alejandra"];
        go = ["gofmt"];
      };
    };

    indent-blankline = {
      enable = true;
    };

    # none-ls = {
    #   enable = true;
    #   enableLspFormat = true;
    #   updateInInsert = false;
    #   sources = {
    #     code_actions = {
    #       gitsigns.enable = true;
    #       statix.enable = true;
    #     };
    #     diagnostics = {
    #       statix.enable = true;
    #       yamllint.enable = true;
    #     };
    #     formatting = {
    #       alejandra.enable = true;
    #       black = {
    #         enable = true;
    #         withArgs = ''
    #           {
    #             extra_args = { "--fast" },
    #           }
    #         '';
    #       };
    #       prettier = {
    #         enable = true;
    #         disableTsServerFormatter = true;
    #         withArgs = ''
    #           {
    #             extra_args = { "--no-semi", "--single-quote" },
    #           }
    #         '';
    #       };
    #       stylua.enable = true;
    #       yamlfmt.enable = true;
    #       prettierd.enable = true;
    #       phpcsfixer.enable = true;
    #       isort.enable = true;
    #       gofmt.enable = true;
    #     };
    #   };
    # };

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          {name = "nvim_lua";}
          {name = "luasnip";}
          {name = "neorg";}
        ];

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";

          "<CR>" = "cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
						}";

          "<Tab>" = "cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require('luasnip').expand_or_jumpable() then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
						else
							fallback()
						end
						end, { 'i', 's' })";

          "<S-Tab>" = "cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require('luasnip').jumpable(-1) then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
						else
							fallback()
						end
						end, { 'i', 's' })";
        };
      };
    };

    telescope = {
      enable = true;

      extensions = {
        file-browser = {
          enable = true;
        };
        fzf-native = {
          enable = true;
        };
        media-files = {
          enable = true;
        };
      };
    };

    luasnip = {
      enable = true;
    };

    comment = {
      enable = true;
    };

    which-key = {
      enable = true;
    };

    gitsigns = {
      enable = true;
    };

    hydra = {
      enable = true;
    };

    obsidian = {
      enable = true;
      settings = {
        dir = "~/trz-obsidian-vault";
      };
    };

    clipboard-image = {
      enable = true;
      clipboardPackage = pkgs.wl-clipboard;
    };

    cloak = {
      enable = true;
    };

    coverage = {
      enable = true;
    };

    notify = {
      enable = true;

      extraOptions = {
        background_colour = "NotifyBackground";
        max_width = 80;
        fps = 40;
        icons = {
          DEBUG = "";
          ERROR = "";
          INFO = "";
          TRACE = "✎";
          WARN = "";
        };
        level = 2;
        minimum_width = 50;
        render = "default";
        stages = "fade_in_slide_out";
        time_formats = {
          notification = "%T";
          notification_history = "%FT%T";
        };
        timeout = 5000;
        top_down = true;
      };
    };

    quickmath = {
      enable = true;
    };

    sandwich = {
      enable = true;
    };

    startup = {
      enable = true;
      theme = "evil";
    };

    surround = {
      enable = true;
    };

    todo-comments = {
      enable = true;
    };

    toggleterm = {
      enable = true;
    };

    wilder = {
      enable = true;
    };

    image = {
      enable = true;
    };

    refactoring = {
      enable = true;
    };

    neoscroll = {
      enable = true;
    };

    noice = {
      enable = true;
    };

    transparent = {
      enable = true;
    };

    lastplace = {
      enable = true;
      openFolds = true;
    };

    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };

      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = ["<ESC>" "q"];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
        dap-go = {
          enable = true;
        };
      };

      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];

        laravel = [
          {
            type = "php";
            request = "launch";
            name = "Debug (Attach) - Remote";
          }
        ];
      };
    };

    lazy = {
      enable = true;
    };

    neocord = {
      enable = true;
      settings = {
        auto_update = true;
        blacklist = [];
        client_id = "1157438221865717891";
        debounce_timeout = 10;
        editing_text = "Editing...";
        enable_line_number = false;
        file_assets = null;
        file_explorer_text = "Browsing...";
        git_commit_text = "Committing changes...";
        global_timer = false;
        line_number_text = "Line %s out of %s";
        log_level = null;
        logo = "auto";
        logo_tooltip = null;
        main_image = "language";
        plugin_manager_text = "Managing plugins...";
        reading_text = "Reading...";
        show_time = true;
        terminal_text = "Using Terminal...";
        workspace_text = "Working on %s";
      };
    };
  };
}
