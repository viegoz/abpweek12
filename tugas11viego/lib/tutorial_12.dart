// tutorial_12.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class Tutorial12Page extends StatefulWidget {
  @override
  _Tutorial12PageState createState() => _Tutorial12PageState();
}

class _Tutorial12PageState extends State<Tutorial12Page> {
  String data = '';
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    const String ipAddress = '192.168.1.1';
    final Uri uri = Uri.parse('http://$ipAddress:8080/api/products');

    try {
      final HttpClientRequest request = await HttpClient().getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
            await response.transform(utf8.decoder).join();
        final decodedData = jsonDecode(responseBody);

        setState(() {
          data = jsonEncode(decodedData);
        });
      } else {
        setState(() {
          errorMessage = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial 12 Page'),
      ),
      body: Center(
        child: data.isEmpty
            ? (errorMessage.isEmpty
                ? CircularProgressIndicator()
                : Text(errorMessage))
            : Text(data),
      ),
    );
  }
}
