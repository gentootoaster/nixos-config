{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs; 
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Python 
        ms-python.python
        ms-python.vscode-pylance
        
        # Node.js/JavaScript/TypeScript
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        
        # HTML/CSS
        ecmel.vscode-html-css
        formulahendry.auto-close-tag
        formulahendry.auto-rename-tag
        
        # Misc useful
        editorconfig.editorconfig
        github.copilot
        github.copilot-chat
        bbenoist.nix
        yzhang.markdown-all-in-one
      ];
      
      userSettings = {
        "editor.fontFamily" = "'Adwaita Mono', monospace";
        "editor.fontSize" = 14;
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        
        "workbench.colorTheme" = "Dark+";
        "workbench.iconTheme" = "material-icon-theme";
        
        "terminal.integrated.fontFamily" = "'Adwaita Mono'";
        "terminal.integrated.fontSize" = 13;
        
        "files.autoSave" = "afterDelay";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "[nix]"."editor.tabSize" = 2;
      };
      
      keybindings = [
        {
          key = "ctrl+shift+l";
          command = "editor.action.selectHighlights";
          when = "editorFocus";
        }
      ];
    };
  };
  
  fonts.fontconfig.enable = true;
}
