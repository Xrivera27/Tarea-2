import 'dart:convert';
import "package:http/http.dart" as http;

void main() {
  // Llamar a la función para obtener datos de películas
  getMoviesData();
}

Future<void> getMoviesData() async {
  final apiKey = '9376dcb02b379b2d05b5f4e146249ed6'; // Reemplaza con tu clave de API de TMDb
  final apiUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    
    // Verificar si la solicitud fue exitosa
    if (data['results'] != null) {
      // Iterar a través de las películas
      final movies = data['results'] as List<dynamic>;
      for (var movie in movies) {
        final title = movie['title'];
        final overview = movie['overview'];
        print('Título: $title');
        print('Resumen: $overview');
        print('---');
      }
    } else {
      print('No se encontraron resultados.');
    }
  } else {
    print('Error al obtener datos de películas. Código de estado: ${response.statusCode}');
  }
}