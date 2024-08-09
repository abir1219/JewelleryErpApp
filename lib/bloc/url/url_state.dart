part of 'url_bloc.dart';

sealed class UrlState extends Equatable {
  final String? url;
  const UrlState({required this.url});
}

final class UrlInitial extends UrlState {
  @override
  List<Object> get props => [];
}
