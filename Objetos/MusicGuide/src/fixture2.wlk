import musico.*
import luisAlberto.*
import Album.*
import cancion.*

object fixture2 {
 	 	const kike = new MusicoDeGrupo("",60,#{},20)
		const soledad = new VocalistaPopular("",55,#{} ,"amor")
		const joaquin = new MusicoDeGrupo("",20,#{},0)
		const lucia = new VocalistaPopular("",70,#{},"")
 	method nuevasRelaciones(){

	
 		const laFamilia = new Cancion("La Familia",264,"Quiero brindar por mi gente sencilla, por el amor brindo por la familia")
 		const especialLaFamilia = new Album(new Date(17,6,92),100000,89000,#{laFamilia})
 		joaquin.compone(especialLaFamilia)
 		
 		const eres = new Cancion("eres",145,"Eres lo mejor que me pas� en la vida, no tengo duda, no habr� m�s nada despu�s de ti. Eres lo que le dio brillo al d�a a d�a, y as� ser� por siempre, no cambiar�, hasta el final de mis d�as.")
 		const corazonAmericano = new Cancion("Corazon Americano",154,"Canta coraz�n, canta m�s alto, que tu pena al fin se va marchando, el nuevo milenio ha de encontrarnos, junto coraz�n, como so�amos")
 		const laSole = new Album(new Date(4,2,05),200000,130000,#{eres,corazonAmericano})
 		soledad.compone(laSole)
 		
 		const cisne = new Cancion("cisne",312,"Hoy el viento se abri� qued� vac�o el aire una vez m�s y el manantial brot� y nadie est� aqu� y puedo ver que solo estallan las hojas al brillar")
 		const almaDeDiamante = new Cancion("Alma de Diamante",216,"Ven a m� con tu dulce luz alma de diamante. Y aunque el sol se nuble despu�s sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven as� con la humanidad alma de diamante")
 		const paraLosArboles = new Album(new Date(31,3,03),50000,49000,#{cisne,almaDeDiamante})
 		luisAlberto.compone(paraLosArboles)
 		
 		const crisantemo = new Cancion("Crisantemo",175,"T�came junto a esta pared, yo quede por aqu�... cuando no hubo m�s luz... quiero mirar a trav�s de mi piel... Crisantemo, que se abri�... encuentra el camino hacia el cielo")
 		const justCrisantemo = new Album(new Date(5,12,07),28000,27500,#{crisantemo})
 		luisAlberto.compone(justCrisantemo)
 	}
	

}