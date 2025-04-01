{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "fm";
    settings = {
      manager = {
        sort_by = "extension";
        sort_dir_first = true;
      };
      opener.text = [
        {
          run = "$EDITOR '$@'";
          block = true;
          for = "unix";
        }
      ];
    };
    plugins = {
      relative-motions = pkgs.fetchFromGitHub {
        owner = "dedukun";
        repo = "relative-motions.yazi";
        rev = "810306563e1928855f5cf61f83801544e3eb3788";
        hash = "sha256-sIS7vtpY8z8D1nHMmr/uZoKREeGsIZuNSG8SnKkjREI=";
      };
    };
    initLua = ''
      require("relative-motions"):setup({ show_numbers="relative_absolute", show_motion = true })
    '';
    keymap = {
      manager.prepend_keymap = [
        {
          run = "plugin relative-motions 1";
          on = [ "1" ];
        }
        {
          run = "plugin relative-motions 2";
          on = [ "2" ];
        }
        {
          run = "plugin relative-motions 3";
          on = [ "3" ];
        }
        {
          run = "plugin relative-motions 4";
          on = [ "4" ];
        }
        {
          run = "plugin relative-motions 5";
          on = [ "5" ];
        }
        {
          run = "plugin relative-motions 6";
          on = [ "6" ];
        }
        {
          run = "plugin relative-motions 7";
          on = [ "7" ];
        }
        {
          run = "plugin relative-motions 8";
          on = [ "8" ];
        }
        {
          run = "plugin relative-motions 9";
          on = [ "9" ];
        }
      ];
    };
  };
}
