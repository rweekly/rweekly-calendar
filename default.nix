# This file was generated by the {rix} R package v0.15.8 on 2025-04-05
# with following call:
# >rix(date = "2025-01-14",
#  > r_pkgs = c("tibble",
#  > "lubridate",
#  > "stringr",
#  > "dplyr",
#  > "clock",
#  > "httr2",
#  > "jsonlite",
#  > "openxlsx2",
#  > "toastui",
#  > "reactable",
#  > "quarto",
#  > "htmltools",
#  > "purrr"),
#  > system_pkgs = c("quarto"),
#  > ide = "none",
#  > project_path = getwd(),
#  > overwrite = TRUE,
#  > r_ver = "4.4.2")
# It uses the `rstats-on-nix` fork of `nixpkgs` which provides improved
# compatibility with older R versions and R packages for Linux/WSL and
# Apple Silicon computers.
# Report any issues to https://github.com/ropensci/rix
let
 pkgs = import (fetchTarball "https://github.com/rstats-on-nix/nixpkgs/archive/2025-01-14.tar.gz") {};
 
  rpkgs = builtins.attrValues {
    inherit (pkgs.rPackages) 
      clock
      dplyr
      htmltools
      httr2
      jsonlite
      lubridate
      openxlsx2
      purrr
      quarto
      reactable
      stringr
      tibble
      toastui;
  };
     
  system_packages = builtins.attrValues {
    inherit (pkgs) 
      glibcLocales
      nix
      quarto
      R
      which
      pandoc;
  };
  
  shell = pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
   LC_ALL = "en_US.UTF-8";
   LC_TIME = "en_US.UTF-8";
   LC_MONETARY = "en_US.UTF-8";
   LC_PAPER = "en_US.UTF-8";
   LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [  rpkgs   system_packages   ];
    
  }; 
in
  {
    inherit pkgs shell;
  }
