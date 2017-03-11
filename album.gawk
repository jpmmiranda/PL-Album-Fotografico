#!/usr/bin/gawk -f

BEGIN{

	  nome = "<li><a href='%s'/>%s\n</a></li>"
	  imagem = "<center> <img src='%s'/> </center>"
	  header= "<html><head><meta charset='UTF-8'/></head><body>"
	  print header > "album.html"
	  print "<h1>Album Fotografico</h1>" > "album.html"
}

/<quem>/		{printf nome, $0".html",$0 > "album.html"
					print header > $0".html"
					print "<h1>" $0 "</h1>" > $0".html"}
