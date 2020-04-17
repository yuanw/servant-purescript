{ mkDerivation
, aeson
, base
, containers
, hpack
, purescript-bridge
, servant
, servant-server
, stdenv
, text
, time
, warp
}:
mkDerivation {
  pname = "servant-purescript";
  version = "0.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson
    base
    containers
    purescript-bridge
    servant
    servant-server
    text
    time
    warp
  ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    aeson
    base
    containers
    purescript-bridge
    servant
    servant-server
    text
    time
    warp
  ];
  prePatch = "hpack";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
