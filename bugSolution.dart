```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse is Map<String, dynamic>) {
          return jsonResponse;
        } else {
          throw Exception('Invalid JSON format');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; // Or handle the error differently
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null; // Or throw an exception
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null; // Or handle the exception as needed
  }
}
```