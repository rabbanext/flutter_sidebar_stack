import 'package:bloc/bloc.dart';
import 'package:flutter_sidebar_stack/ui/pages/messages_page.dart';
import 'package:flutter_sidebar_stack/ui/pages/my_cards_page.dart';
import 'package:flutter_sidebar_stack/ui/pages/backlog_page.dart';
import 'package:flutter_sidebar_stack/ui/pages/rtlh_page.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  MessagesClickedEvent,
  BacklogClickedEvent,
  RtlhClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({this.onMenuTap});

  @override
  NavigationStates get initialState => MyCardsPage(
    onMenuTap: onMenuTap,
  );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashboardClickedEvent:
        yield MyCardsPage(
          onMenuTap: onMenuTap,
        );
      break;
      case NavigationEvents.MessagesClickedEvent:
        yield MessagesPage(
          onMenuTap: onMenuTap,
        );
      break;
      case NavigationEvents.BacklogClickedEvent:
        yield BacklogPage(
          onMenuTap: onMenuTap,
        );
      break;
      case NavigationEvents.RtlhClickedEvent:
        yield RtlhPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}