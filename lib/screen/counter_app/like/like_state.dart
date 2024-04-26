part of 'like_bloc.dart';

 class LikeState {
   final bool like;
   const LikeState({this.like = false});

   @override
   List<Object> get props => [like];
 }


