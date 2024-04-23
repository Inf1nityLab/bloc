import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'like_state.dart';

class LikeCubit extends Cubit<bool> {
  LikeCubit() : super(false);

  void like(){
    emit(!state);
  }
}
