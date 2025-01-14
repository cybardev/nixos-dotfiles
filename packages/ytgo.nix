{
  lib,
  pkgs,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "ytgo";
  version = "3.1.3";

  src = fetchFromGitHub {
    owner = "cybardev";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-cAnZfXwk4zv9I8FDDe+xpR3TxlMgJjiLPT9h61iEqVY=";
  };

  nativeBuildInputs = [ pkgs.makeWrapper ];

  vendorHash = "sha256-62bDFcunLygMpAY63C/b3g9L97XZ9HZbmz4RMecJwO4=";

  ldflags = [
    "-s"
    "-w"
  ];

  # checks fail cuz needs internet
  doCheck = false;
  # tests run in project repo pipeline

  postFixup = with pkgs; ''
    wrapProgram $out/bin/${pname} \
      --prefix PATH : ${
        lib.makeBinPath [
          ffmpeg
          yt-dlp
          mpv
        ]
      }
  '';

  meta = {
    description = "A Go program to find and watch YouTube videos from the terminal without requiring API keys";
    homepage = "https://github.com/cybardev/${pname}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = pname;
  };
}
