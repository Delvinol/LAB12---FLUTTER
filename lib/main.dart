import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isWeb) {
      return CupertinoApp(
        title: 'Flutter Demo',
        home: CupertinoLoginPage(),
      );
    } else if (UniversalPlatform.isAndroid) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MaterialLoginPage(),
      );
    } else {
      // Default to CupertinoApp for other platforms like iOS
      return CupertinoApp(
        title: 'Flutter Demo',
        home: CupertinoLoginPage(),
      );
    }
  }
}

class MaterialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page - Material'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png', height: 100, width: 100),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login Page - Cupertino'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png', height: 100, width: 100),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: CupertinoTextField(
                placeholder: 'Username',
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                placeholderStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: CupertinoTextField(
                placeholder: 'Password',
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                obscureText: true,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                placeholderStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: CupertinoButton.filled(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
