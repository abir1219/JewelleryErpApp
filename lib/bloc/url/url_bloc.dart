import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'url_event.dart';
part 'url_state.dart';

class UrlBloc extends Bloc<UrlEvent, UrlState> {
  UrlBloc() : super(const UrlInitial(url: '')) {
    on<UrlEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
