import '../models/user.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  // 시뮬레이션을 위한 더미 데이터
  final List<User> _users = [
    User(
      id: '1',
      name: 'John Doe',
      email: 'john@example.com',
      avatar: null, // 네트워크 이미지 대신 null로 설정
    ),
    User(
      id: '2',
      name: 'Jane Smith',
      email: 'jane@example.com',
      avatar: null, // 네트워크 이미지 대신 null로 설정
    ),
  ];

  Future<List<User>> getUsers() async {
    // API 호출 시뮬레이션
    await Future.delayed(const Duration(milliseconds: 500));
    return _users;
  }

  Future<User?> getUserById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<User> createUser(User user) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _users.add(user);
    return user;
  }

  Future<User> updateUser(User user) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      return user;
    }
    throw Exception('User not found');
  }

  Future<bool> deleteUser(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _users.indexWhere((user) => user.id == id);
    if (index != -1) {
      _users.removeAt(index);
      return true;
    }
    return false;
  }
}
