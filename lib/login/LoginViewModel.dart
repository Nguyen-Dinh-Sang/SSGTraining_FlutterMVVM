import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:flutter_mvvm/helper/Validation.dart';

class LoginViewModel {
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var emailValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      sink.add(Validation.validationEmail(email));
    }
  );

  var passValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink) {
        sink.add(Validation.validationPass(pass));
      }
  );

  Stream<String> get emailStream => _emailSubject.stream.transform(emailValidation);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream => _passSubject.stream.transform(passValidation);
  Sink<String> get passSink => _passSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;


  LoginViewModel() {
    Rx.combineLatest2(_emailSubject, _passSubject, (email, pass) {
      return Validation.validationEmail(email) == null && Validation.validationPass(pass) == null;
    }).listen((enable) {//lắng nghe giá trị trả về
      btnSink.add(enable);
    });
  }

  dispose() {
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}