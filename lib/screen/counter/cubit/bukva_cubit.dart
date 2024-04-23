import 'package:bloc/bloc.dart';


class BukvaCubit extends Cubit<String> {
  BukvaCubit() : super('Hello');


  void lower(){
    emit(state.toLowerCase());
  }

  void upper(){
    emit(state.toUpperCase());
  }
}
