{ pkgs }: 
let
	#imgLink = "https://raw.githubusercontent.com/ahmadAria001/discord-theme/main/mrg.jpg?token=GHSAT0AAAAAACUDSU2IRGKOS45LENIQVPOIZWOZCFQ";
	#image = pkgs.fetchurl {
	#	url = imgLink;
	#	sha256 = null;
	#};
in
pkgs.stdenv.mkDerivation {
	name = "sddm-sugar-dark";
	src = pkgs.fetchFromGitHub {
		owner = "MarianArlt";
		repo = "sddm-sugar-dark";
		rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
		sha256 = "sha256-flOspjpYezPvGZ6b4R/Mr18N7N3JdytCSwwu6mf4owQ=";
	};
	#installPhase = ''
	#	mkdir -p $out
	#	cp -R ./* $out/
	#	cd $out/
	#	rm Background.jpg
	#	cp -r ${image} $out/Background.jpg
	#'';
	installPhase = ''
		mkdir -p $out
		cp -R ./* $out/
	'';
}
