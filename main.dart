// Import necessary packages
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Chatbot App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to AI App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AI Chatbot Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Explore the power of AI with our assistant and online tutor.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AIAssistantPage()),
                );
              },
              child: Text('AI Assistant'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AIOnlineTutorPage()),
                );
              },
              child: Text('AI Online Tutor'),
            ),
          ],
        ),
      ),
    );
  }
}

class AIAssistantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Assistant'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to the AI Assistant Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class AIOnlineTutorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Online Tutor'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to the AI Online Tutor Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Chatbot Logic (Replace this with your actual OpenAI API key)
const apiKey = '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'; // Store your OpenAI API key here.

Future<String> fetchAIResponse(String query) async {
  final url = Uri.parse('https://api.openai.com/v1/completions');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: json.encode({
      'model': 'text-davinci-003',
      'prompt': query,
      'max_tokens': 150,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['choices'][0]['text'].trim();
  } else {
    throw Exception('Failed to load AI response');
  }
}
