import 'package:flutterdomeapp/repositorys/remote/model/remote_model_login.dart';

abstract class AbsRemoteModel {
  Map<String, dynamic> toJson();

  AbsRemoteModel.fromJson(Map<String, dynamic> json);
}

class RemoteResult<T extends AbsRemoteModel> {
  T _data;

  final _model = <Type, Function>{  // 踩雷點XD
    LoginModel: (Map<String, dynamic> json) => LoginModel.fromJson(json)

  };

  RemoteResult({T data}) {
    this._data = data;
  }

  // ignore: unnecessary_getters_setters
  T get data => _data;

  // ignore: unnecessary_getters_setters
  set data(T data) => _data = data;

  RemoteResult.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? _model[T](json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}
