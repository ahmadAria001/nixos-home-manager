{pkgs, ...}:{
  programs.nixvim = {
    extraPlugins = with pkgs; [
      stylua
      prettierd

      vimPlugins.vim-prettier
      vimPlugins.nvim-dbee
      vimPlugins.markdown-preview-nvim
      vimPlugins.auto-pairs
      vimPlugins.nvim-ts-autotag
      vimPlugins.emmet-vim
      vimPlugins.flutter-tools-nvim
      vimPlugins.plenary-nvim
      vimPlugins.dressing-nvim

      nodePackages_latest.prettier
      isort
      black
      php83Packages.php-cs-fixer
      alejandra

      (vimUtils.buildVimPlugin {
	name = "supermaven-nvim";
	src = fetchFromGitHub {
	  owner = "supermaven-inc";
	  repo = "supermaven-nvim";
	  rev = "d71257f431e190d9236d7f30da4c2d659389e91f";
	  hash = "sha256-v5OIPQJhNdZA3Prw6DGq8fRxsmKvouGbt0IKhAZdlQM=";
	};
      })

      (vimUtils.buildVimPlugin {
	name = "nvim-projector";
	src = fetchFromGitHub {
	  owner = "kndndrj";
	  repo = "nvim-projector";
	  rev = "fdd9936deacd54b9bc69eef62b2835d9deaec53b";
	  hash = "sha256-1peb3U0f1+V+GSN5+hZPCTYbpJC45ZyEibxumNgxOIU=";
	};
      })
    ];

    plugins = {
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

      jupytext = {
	enable = true;
	settings = {
	  custom_language_formatting = {
	    python = {
	      extension = "md";
	      force_ft = "markdown";
	      style = "markdown";
	    };
	  };
	  force_ft = null;
	  output_extension = "auto";
	  style = "light";
	};
      };

      lualine = {
	enable = true;
      };

      luasnip = {
	enable = true;
	fromVscode = [
	  {}
	  {paths = ./snippets;}
	];
	extraConfig = {
	  enable_autosnippets = true;
	  store_selection_keys = "<Tab>";
	};
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
	    filetypes = ["rust"];
	  };
	  tsserver = {
	    enable = true;
	  };
	  lua-ls = {
	    enable = true;
	    filetypes = ["lua"];
	  };
	  html = {
	    enable = true;
	    filetypes = ["html"];
	  };
	  cssls = {
	    enable = true;
	    filetypes = ["css"];
	  };
	  csharp-ls = {
	    enable = true;
	    filetypes = ["cs"];
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
	    filetypes = ["php"];
	  };
	  jsonls = {
	    enable = true;
	    filetypes = ["json"];
	  };
	  nixd = { 
	    enable = true;
	    filetypes = ["nix"];
	  };
	  sqls = {
	    enable = true; 
	    filetypes = ["sql"];
	  };
	  svelte = {
	    enable = true;
	    filetypes = ["svelte"];
	  };
	  tailwindcss = {
	    enable = true;
	    filetypes  = [ 
	      "aspnetcorerazor" "astro" "astro-markdown" "blade" "clojure" "django-html" "htmldjango" "html" "html-eex" "markdown" "mdx"
	      "nunjucks" "razor" "slim" "twig" "css" "less" "postcss" "sass" "scss" "stylus" "sugarss" "javascript" "javascriptreact"
	      "reason" "rescript" "typescript" "typescriptreact" "vue" "svelte" "templ"
	    ];
	  };
	  gopls = {
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
	    {name = "supermaven";}
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

      friendly-snippets = {
	enable = true;
      };

      lazy = {
	enable = true;
	plugins = [
	  # {
	  #   name = "markdown-preview.nvim";
	  #   enabled = true;
	  #   pkg = pkgs.;
	  #   cmd = [ "MarkdownPreviewToggle" "MarkdownPreview" "MarkdownPreviewStop" ];
	  #   ft = [ "markdown" ];
	  #   config = ''
	  #   '';
	  # }
	];
      };

      neocord = {
	enable = true;
	settings = {
	  auto_update = true;
	  blacklist = [];
	  client_id = "1157438221865717891";
	  debounce_timeout = 10;
	  editing_text = "Editing %s";
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
	  reading_text = "Reading %s";
	  show_time = true;
	  terminal_text = "Using Terminal...";
	  workspace_text = "Working...";
	};
      };
    };

      extraConfigLua = ''
      require("supermaven-nvim").setup({
	keymaps = {
	  accept_suggestion = "<Tab>",
	  clear_suggestion = "<C-]>",
	  accept_word = "<C-j>",
},
	ignore_filetypes = { cpp = true },
	color = {
	  suggestion_color = "#ffffff",
	  cterm = 244,
	},
	log_level = "info", -- set to "off" to disable logging completely
	disable_inline_completion = false, -- disables inline completion for use with cmp
	disable_keymaps = false -- disables built in keymaps for more manual control
      });

      require("dbee").setup ({
	sources = {
	  require("dbee.sources").MemorySource:new({
	    {
	      name = "...",
	      type = "...",
	      url = "...",
	    },
	    -- ...
	  }),
	  require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
	  require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
	},
      })

      require("projector").setup({})

      require("flutter-tools").setup({
	  flutter_path = nil,
                flutter_lookup_cmd = "asdf where flutter",
                fvm = false,
                widget_guides = { enabled = true },
                lsp = {
                    settings = {
                        showtodos = true,
                        completefunctioncalls = true,
                        analysisexcludedfolders = {
                            vim.fn.expand("$Home/.pub-cache"),
                        },
                        renamefileswithclasses = "prompt",
                        updateimportsonrename = true,
                        enablesnippets = false,
                    },
                },
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    exception_breakpoints = {},
                    register_configurations = function(paths)
                        local dap = require("dap")
                        -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
                        dap.adapters.dart = {
                            type = "executable",
                            command = paths.flutter_bin,
                            args = { "debug-adapter" },
                        }
                        dap.configurations.dart = {}
                        require("dap.ext.vscode").load_launchjs()
                    end,
                },
      })

      require('nvim-ts-autotag').setup({
	opts = {
	  -- Defaults
	  enable_close = true, -- Auto close tags
	  enable_rename = true, -- Auto rename pairs of tags
	  enable_close_on_slash = false -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	-- per_filetype = {
	--   ["html"] = {
	--    enable_close = true
        --   }
	-- }
      })

    '';
  };
}
