import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'detail_page.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List posts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

Future<void> fetchPosts() async {
  setState(() {
    isLoading = true;  
    errorMessage = null; 
  });

  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
        isLoading = false; 
      });
    } else {
      throw Exception("Failed to load data");
    }
  } catch (error) {
    setState(() {
      errorMessage = error.toString();
      isLoading = false;
    });
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Posts List', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 234, 231, 231),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchPosts,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.black))
          : errorMessage != null
              ? Center(
                  child: Text(errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 18)))
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            posts[index]['title'],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailScreen(post: posts[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}