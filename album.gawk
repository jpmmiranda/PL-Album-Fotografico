#!/usr/bin/gawk -f

BEGIN{

	  nome = <LI><b> %s </b></LI>
	  imagem = <center> <img src="%s"/> </center>
	  header="<html><head><meta charset='UTF-8'/></head><body>"
	  print header > "album.html"
	  print "<h1>Album Fotografico</h1>" > "album.html"
}

(?<=quem\>)([^<>\n]*)(?=\<)		{printf nome, $1}