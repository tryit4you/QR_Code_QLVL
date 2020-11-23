class UserModel {
  String userid;
  String username;
  String password;
  String email;
  String avatarUrl;
  String phoneNumber;
  DateTime birthday;
  String type;
  String token;
  String renewalToken;
  UserModel(
      {this.userid,
      this.username,
      this.password,
      this.email,
      this.avatarUrl,
      this.phoneNumber,
      this.birthday,
      this.type,
      this.token,
      this.renewalToken});
  factory UserModel.fromJson(Map<String, dynamic> responseData) {
    return UserModel(
        userid: responseData['id'],
        username: responseData['name'],
        email: responseData['email'],
        phoneNumber: responseData['phone'],
        type: responseData['type'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']);
  }
  UserModel.userLogin({String userName, String passWord}) {
    this.username = userName;
    this.password = passWord;
  }
  UserModel.defaultUser(Map userData) {
    username = userData['username'];
    password = userData['password'];
  }
  UserModel.userRegistor(String userName, String passWord, String email) {
    this.username = userName;
    this.password = passWord;
    this.email = email;
  }
}
