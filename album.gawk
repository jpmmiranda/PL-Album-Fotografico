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

/<foto ficheiro=".*>/	{i++
						nomeFich[i] = $0
						gsub(/.*<foto ficheiro="/,"",nomeFich[i])
						gsub(/">.*/,"",nomeFich[i])
						gsub(/.jpg/,"",nomeFich[i])
						}

/<onde>.*<\/onde>/		{local[i] = $0
						gsub(/[ \t]*<onde>[ \t]*/,"",local[i])
						gsub(/[ \t]*<\/onde>.*/,"",local[i])
						}

/<quando data=".*>/		{data[i] = $0
						gsub(/[ \t]*<quando data="/,"",data[i])
						gsub(/[ \t]*".*/,"",data[i])
						}

/<quem>.*<\/quem>/	{pessoas[i] = $0
					gsub(/[ \t]*<quem>[ \t]*/,"",pessoas[i])
					gsub(/[ \t]*<\/quem>[ \t]*/,"",pessoas[i])
 					}

END{
	for(j = 0; j<i;j++){
		if(pessoas[j] != ""){
			printf nome, nomeFich[j]".html",pessoas[j] > "album.html"
			print header > nomeFich[j]".html"
			printf titulo, pessoas[j] > nomeFich[j]".html"
			print "</body></html>" > nomeFich[j]".html"
		}
		else{
			printf nome, nomeFich[j]".html","Pessoa(s) desconhecida(s)" > "album.html"
			print header > nomeFich[j]".html"
			printf titulo, "Pessoa(s) desconhecida(s)" > nomeFich[j]".html"
			print "</body></html>" > nomeFich[j]".html"
		}

		printf imagem, nomeFich[j]".jpg" > nomeFich[j]".html"

		if(local[j] != "") printf "<li>Local: %s</li>", local[j] > nomeFich[j]".html"
		else printf "<li>Local: Não disponível</li>"> nomeFich[j]".html"

		if(data[j] != "") printf "<li>Data: %s</li>", data[j] > nomeFich[j]".html"
		else printf "<li>Data: Não disponível</li>"> nomeFich[j]".html"

	}
	print "</body></html>" > "album.html"
}