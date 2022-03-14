import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:t_shert/model/soura_model.dart';
import 'package:t_shert/provider/state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InationalState());
  static AppCubit get(context) => BlocProvider.of(context);

  // Model? azkarModel;
  SouraModel? souraModel;
  void getAzkar() {
    emit(GetAzkerLoding());
    rootBundle.loadString('jsonfile/soura.json').then((value) {
      final list = json.decode(value);

      souraModel = SouraModel.fromjson(list);
      emit(GetAzkerScasses());
    }).catchError((e) {
      log(e.toString());
      emit(GetAzkerError(e.toString()));
    });
  }

  // SouraDataModel? souraDataModel;
  // void getsoura() {
  //   emit(GetsouraLoding());
  //   rootBundle.loadString('jsonfile/soura_contante.json').then((value) {
  //     final list = json.decode(value);

  //     souraDataModel = SouraDataModel.fromjson(list);
  //     emit(GetsouraScasses());
  //   }).catchError((e) {
  //     log(e.toString());
  //     emit(GetsouraError(e.toString()));
  //   });
  // }
}
