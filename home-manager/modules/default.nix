let
  modules = builtins.readDir ./.;
  imports = builtins.attrValues (
    builtins.mapAttrs (name: _: ./. + "/${name}") 
    (builtins.removeAttrs modules [ "default.nix" ])
  );
in {
  imports = imports;
}
