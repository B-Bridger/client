import '../models/user.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  // 시뮬레이션을 위한 더미 데이터
  // TODO: 모델 변경으로 인해, 주석 처리 -> 시뮬레이션 실행을 위해 더미 데이터 수정 필요
  // final List<User> _users = [
  //   User(
  //     userID: '1',
  //     name: 'John Doe',
  //     email: 'john@example.com',
  //     profile: null, // 네트워크 이미지 대신 null로 설정
  //   ),
  //   User(
  //     userID: '2',
  //     name: 'Jane Smith',
  //     email: 'jane@example.com',
  //     profile: null, // 네트워크 이미지 대신 null로 설정
  //   ),
  // ];

  final List<User> _users = [];

  Future<List<User>> getUsers() async {
    // API 호출 시뮬레이션
    await Future.delayed(const Duration(milliseconds: 500));
    return _users;
  }

  Future<User?> getUserByUserID(String userID) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _users.firstWhere((user) => user.userID == userID);
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
    final index = _users.indexWhere((u) => u.userID == user.userID);
    if (index != -1) {
      _users[index] = user;
      return user;
    }
    throw Exception('User not found');
  }

  Future<bool> deleteUser(String userID) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _users.indexWhere((user) => user.userID == userID);
    if (index != -1) {
      _users.removeAt(index);
      return true;
    }
    return false;
  }
}
