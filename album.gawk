#!/usr/bin/gawk -f

BEGIN{FS=">";

	  nome = "<li><a href='%s'>%s</a></li>"
	  imagem = "<center> <img src='%s'/> </center>"
	  header= "<html><head><meta charset='UTF-8'/></head><body>"
	  print header > "album.html"
	  print "<h1>Album Fotografico</h1>" > "album.html"
}

/<quem>.*<\/quem>/	{split($2, a, "<", seps)
 					printf nome, a[1], a[1] > "album.html"
 					printf header > a[1]".html"
 					printf "<h1>" a[1] "</h1>" > "album.html"}


