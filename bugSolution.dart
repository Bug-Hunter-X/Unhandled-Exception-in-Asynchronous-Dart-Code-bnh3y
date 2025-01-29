```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //Log detailed error
      print('Error fetching data: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('API request failed with status code: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
    //Handle network issues
    throw Exception('Network error: Please check your internet connection');
  } on FormatException catch (e) {
    print('JSON format error: $e');
    throw Exception('Invalid data received from the API');
  } catch (e) {
    print('An unexpected error occurred: $e');
    //Implement a suitable fallback
    return {'error': 'An unexpected error occurred'};
  }
}
```