class AppUrl {
  static const String liveBaseUrl = 'https://remote-ur/api/qr_code_api';
  static const String localBaseURL = "https://10.66.0.43:5001/api/qr_code_api";

  static const String baseURL = liveBaseUrl;
  static const String login = baseURL + "/login";
  static const String register = baseURL + "/registration";
  static const String forgotPassword = baseURL + "/forgot-password";
}
