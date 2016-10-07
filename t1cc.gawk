BEGIN {FS = ": |:"}
/title:/ { tit[0] = $2
           gsub(/^= *|\* *| *$/,"",tit[0]) 
         }
/author:/ { aut = $2
            split(aut, autor, " ; |;|,", seps)
	    for (i=1; i<=length(autor); i++) 
            {
	      gsub(/^ *| *$/,"", autor[i])
	      if (autores[autor[i]] =="") autores[autor[i]] = tit[0]
	      else autores[autor[i]] = autores[autor[i]]", "tit[0]
            }
	  }

END { for(valores in autores) print valores, "->", autores[valores] }


