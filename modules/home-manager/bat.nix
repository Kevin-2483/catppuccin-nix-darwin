{ config, lib, ... }:
let
  inherit (config.catppuccin) sources;
  cfg = config.programs.bat.catppuccin;
  enable = cfg.enable && config.programs.bat.enable;
  themeName = "Catppuccin ${lib.ctp.mkUpper cfg.flavour}";
in
{
  options.programs.bat.catppuccin = lib.ctp.mkCatppuccinOpt "bat";

  config = lib.mkIf enable {
    programs.bat = {
      config.theme = themeName;

      themes.${themeName} = {
        src = sources.bat;
        file = "themes/${themeName}.tmTheme";
      };
    };
  };
}
