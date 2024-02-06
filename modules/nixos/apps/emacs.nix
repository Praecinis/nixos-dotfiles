{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    emacs-all-the-icons-fonts
    vscode-extensions.file-icons.file-icons
    material-icons
    font-awesome_5
  ];
  
  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = with pkgs; ((emacsPackagesFor emacs).emacsWithPackages
     	(epkgs: with epkgs;
		    [
          use-package
          highlight-indent-guides
          treemacs
          doom-themes doom-modeline 
          nerd-icons nerd-icons-ibuffer nerd-icons-dired
          sqlite3 sql-indent
          org-wc
          org-roam org-roam-ui
          org-bullets
          magit
          direnv
          markdown-mode d2-mode plantuml-mode mermaid-mode
          #typst-mode
          polymode
          docker dockerfile-mode docker-compose-mode
			    nix-mode js3-mode js2-mode go-mode dart-mode
          nixpkgs-fmt
          svelte-mode
          clojure-mode 
			    cider slime
          restclient ob-restclient
          htmlize
          mode-icons all-the-icons spaceline-all-the-icons all-the-icons-dired
          ob-d2 ob-go ob-mermaid powershell http
          ob-nix ob-sql-mode
          ox-hugo 
          gnuplot
          corfu
          esxml
          pdf-tools
		    ])); 
  };
}
