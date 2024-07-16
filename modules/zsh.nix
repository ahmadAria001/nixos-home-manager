{...}: {
  # Zsh shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = false;

    shellAliases = {
      cat = "bat -p";
      ff = "fastfetch";

      # git
      gaa = "git add --all";
      gcam = "git commit --all --message";
      gcl = "git clone";
      gco = "git checkout";
      ggl = "git pull";
      ggp = "git push";

      du = "dust";
      grep = "rg";

      # kubectl
      k = "kubectl";
      kgno = "kubectl get node";
      kdno = "kubectl describe node";
      kgp = "kubectl get pods";
      kep = "kubectl edit pods";
      kdp = "kubectl describe pods";
      kdelp = "kubectl delete pods";
      kgs = "kubectl get svc";
      kes = "kubectl edit svc";
      kds = "kubectl describe svc";
      kdels = "kubectl delete svc";
      kgi = "kubectl get ingress";
      kei = "kubectl edit ingress";
      kdi = "kubectl describe ingress";
      kdeli = "kubectl delete ingress";
      kgns = "kubectl get namespaces";
      kens = "kubectl edit namespace";
      kdns = "kubectl describe namespace";
      kdelns = "kubectl delete namespace";
      kgd = "kubectl get deployment";
      ked = "kubectl edit deployment";
      kdd = "kubectl describe deployment";
      kdeld = "kubectl delete deployment";
      kgsec = "kubectl get secret";
      kdsec = "kubectl describe secret";
      kdelsec = "kubectl delete secret";

      ld = "lazydocker";
      lg = "lazygit";

      repo = "cd $HOME/Documents/repositories";
      temp = "cd $HOME/Downloads/temp";

      top = "btm";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      ls = "eza --icons always"; # default view
      ll = "eza -bhl --icons --group-directories-first"; # long list
      la = "eza -abhl --icons --group-directories-first"; # all list
      lt = "eza --tree --level=2 --icons"; # tree
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck" "starship" "z"];
    };
    initExtra = ''
      print -P "%F{#00ff84}┌────────────────────────────────── %F{#ff0062}Welcome %F{#00ff84}──────────────────────────────────┐"
      print -P '	%F{green}  ______  %F{red}  ______   %F{#00faa2}   ______   %F{#ff006a}   ______   %F{#ff006a}  ______   %F{#8000ff}   ______' &&
      print -P '	%F{green} /\\__  _\\ %F{red} /\\  ___\\  %F{#00faa2}  /\\  == \\  %F{#ff006a}  /\\  ___\\  %F{#ff006a} /\\___  \\  %F{#8000ff}  /\\  __ \\' &&
      print -P '	%F{green} \\/_/\\ \\/ %F{red} \\ \\  __\\  %F{#00faa2}  \\ \\  __<  %F{#ff006a}  \\ \\  __\\  %F{#ff006a} \\/_/  /__ %F{#8000ff}  \\ \\  __ \\' &&
      print -P '	%F{green}    \\ \\_\\ %F{red}  \\ \\_____\\%F{#00faa2}   \\ \\_\\ \\_\\%F{#ff006a}   \\ \\_____\\%F{#ff006a}   /\\_____\\%F{#8000ff}   \\ \\_\\ \\_\\' &&
      print -P '	%F{green}     \\/_/ %F{red}   \\/_____\/%F{#00faa2}    \\/_/ /_/%F{#ff006a}    \\/_____/%F{#ff006a}   \\/_____/%F{#8000ff}    \\/_/\\\/_/' &&
      print -P "%F{#00ff84}└──────────────────────────────────────────────────────────────────────────────┘" &&
      fastfetch
    '';
  };

  programs.starship = {
    enable = true;
    catppuccin.enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      directory = {
        style = "bold lavender";
      };
      aws = {
        disabled = true;
      };
      kubernetes = {
        disabled = true;
        style = "bold pink";
        format = "[$symbol$context( \($namespace\))]($style)";
        contexts = [
          {
            context_pattern = "arn:aws:eks:(?P<var_region>.*):(?P<var_account>[0-9]{12}):cluster/(?P<var_cluster>.*)";
            context_alias = "$var_cluster";
          }
        ];
      };
      right_format = "$kubernetes";
    };
  };
}
