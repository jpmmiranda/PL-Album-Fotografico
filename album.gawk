#!/usr/bin/gawk -f

BEGIN{
	  nome = "<li><a href='%s'>%s</a></li>"
	  imagem = "<center> <img src='%s'/> </center>"
	  header= "<html><head><meta charset='UTF-8'/></head><body>"
	  headerClose = "</html><head><meta charset='UTF-8'/></head><body>"
	  titulo = "<h1>%s</h1>"
	  print header > "album.html"
	  print "<h1>Album Fotografico</h1>" > "album.html"
}

/<foto ficheiro=".*">/	{nomeFich[i] = $0
						gsub(/.*<foto ficheiro="/,null,nomeFich[i])
						gsub(/">.*/,null,nomeFich[i])
						gsub(/.jpg/,null,nomeFich[i])
						i++
						}

/<quem>.*<\/quem>/	{teste[i] = $0
					gsub(/[ \t]*<quem>[ \t]*/,"",teste[i])
					gsub(/[ \t]*<\/quem>[ \t]*/,"",teste[i])
 					}

END{
	for(j = 0; j<i;j++){
		if(teste[j] != ""){
			printf nome, nomeFich[j]".html",teste[j] > "album.html"
			print header > nomeFich[j]".html"
			printf titulo, teste[j] > nomeFich[j]".html"
			print "</body></html>" > nomeFich[j]".html"
		}
	}
	print "</body></html>" > "album.html"
}