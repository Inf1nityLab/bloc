import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(const LikeState()) {
    on<Like>((event, emit) {
      emit(LikeState(like: !state.like));
    });
  }
}
