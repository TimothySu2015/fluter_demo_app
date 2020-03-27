import 'package:flutterdomeapp/repositorys/remote/model/remote_result.dart';

class LoginParam {
  String _storeAccount;
  String _storePassword;

  LoginParam({String storeAccount, String storePassword}) {
    this._storeAccount = storeAccount;
    this._storePassword = storePassword;
  }

  String get storeAccount => _storeAccount;
  set storeAccount(String storeAccount) => _storeAccount = storeAccount;
  String get storePassword => _storePassword;
  set storePassword(String storePassword) => _storePassword = storePassword;

  LoginParam.fromJson(Map<String, dynamic> json) {
    _storeAccount = json['storeAccount'];
    _storePassword = json['storePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeAccount'] = this._storeAccount;
    data['storePassword'] = this._storePassword;
    return data;
  }
}

class LoginModel implements AbsRemoteModel {
  String _accessToken;
  String _refreshToken;
  bool _isNotifyChangePassword;

  LoginModel({String accessToken, String refreshToken, bool isNotifyChangePassword}) {
    this._accessToken = accessToken;
    this._refreshToken = refreshToken;
    this._isNotifyChangePassword = isNotifyChangePassword;
  }

  // ignore: unnecessary_getters_setters
  String get accessToken => _accessToken;
  // ignore: unnecessary_getters_setters
  set accessToken(String accessToken) => _accessToken = accessToken;
  // ignore: unnecessary_getters_setters
  String get refreshToken => _refreshToken;
  // ignore: unnecessary_getters_setters
  set refreshToken(String refreshToken) => _refreshToken = refreshToken;
  // ignore: unnecessary_getters_setters
  bool get isNotifyChangePassword => _isNotifyChangePassword;
  // ignore: unnecessary_getters_setters
  set isNotifyChangePassword(bool isNotifyChangePassword) =>
      _isNotifyChangePassword = isNotifyChangePassword;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _accessToken = json['accessToken']     ;
    _refreshToken = json['refreshToken'];
    _isNotifyChangePassword = json['isNotifyChangePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this._accessToken;
    data['refreshToken'] = this._refreshToken;
    data['isNotifyChangePassword'] = this._isNotifyChangePassword;
    return data;
  }
}