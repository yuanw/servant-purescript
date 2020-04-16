{ mkDerivation
, aeson
, base
, containers
, hpack
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
