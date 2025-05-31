import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/post_model.dart';
import '../models/todo_model.dart';

class UserRepository {
  final String baseUrl = 'https://dummyjson.com';

  Future<List<UserModel>> fetchUsers({int limit = 10, int skip = 0, String? search}) async {
    final query = search != null && search.isNotEmpty
        ? '/users/search?q=$search'
        : '/users?limit=$limit&skip=$skip';

    final response = await http.get(Uri.parse('$baseUrl$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['users'] as List).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<List<PostModel>> fetchUserPosts(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/user/$userId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['posts'] as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<List<TodoModel>> fetchUserTodos(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/todos/user/$userId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['todos'] as List).map((e) => TodoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }
}
