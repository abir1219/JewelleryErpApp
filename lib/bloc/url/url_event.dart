part of 'url_bloc.dart';

abstract class UrlEvent extends Equatable {
  const UrlEvent();

  @override
  List<Object> get props => [url];
}

class VerifyUrl extends UrlEvent {
  final String? url;

  const VerifyUrl({required this.url});

  @override
  List<Object> get props => [url];
}
