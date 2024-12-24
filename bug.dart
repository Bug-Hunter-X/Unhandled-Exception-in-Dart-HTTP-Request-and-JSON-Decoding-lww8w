```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle JSON decoding
      final jsonResponse = jsonDecode(response.body);
      // Access data from jsonResponse
      print('Data fetched successfully: $jsonResponse');
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle error appropriately
    print('Error fetching data: $e');
    rethrow; // Re-throw to allow higher-level handling if needed
  }
}
```