
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

//The class search info in a API
// https://openlibrary.org/dev/docs/api/books#data
class Livre{


   String id;
   String title;
   List<String> editor = new List<String>();
   String date;
   int year;
   int numberPages;
   // 'lien vers les différentes taille de couvertures'
   String urlCover_Taille_S;
   String urlCover_Taille_M;
   String urlCover_Taille_L;
   //constructor
   Livre( {this.title ="",this.id = ""});

   @override
   String toString() => 'Livre: $title, $editor, $year, $id';

   Future<String> getABook() async {
      var res = "null";
      // Construction de l'URL a appeler
      var url = "https://openlibrary.org/isbn/9782809491708.json";
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
         var jsonResponse = convert.jsonDecode(response.body);
         // 'fichier JSON'
         print(jsonResponse);
         print(jsonResponse['title']);
         this.title = jsonResponse['title'];
         print(jsonResponse['publishers']);  // this.editor = jsonResponse['publishers']; //return a tab //this.editor.forEach((element) => print(element));
         jsonResponse['publishers'].forEach((element) =>  this.editor.insert( this.editor.length, element));
         print(jsonResponse['publish_date']);
         this.date = jsonResponse['publish_date'];
         print(jsonResponse['number_of_pages']);
         this.numberPages = jsonResponse['number_of_pages'];
         print(jsonResponse['isbn_13']);
         this.id = jsonResponse['isbn_13'][0];
         this.urlCover_Taille_S = "http://covers.openlibrary.org/b/isbn/9782809491708-S.jpg";
         this.urlCover_Taille_M = "http://covers.openlibrary.org/b/isbn/9782809491708-M.jpg";
         this.urlCover_Taille_L = "http://covers.openlibrary.org/b/isbn/9782809491708-L.jpg";


         res ="ok";
      } else {
         print('Request failed with status: ${response.statusCode}.');
      }
      return res;
   }
}