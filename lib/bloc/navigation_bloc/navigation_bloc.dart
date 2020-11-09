import 'package:bloc/bloc.dart';
import 'package:flutter_sidebar_stack/ui/pages/pengembang_page.dart';
import 'package:flutter_sidebar_stack/ui/pages/my_cards_page.dart';
import 'package:flutter_sidebar_stack/ui/pages/backlog_page.dart';
import 'package:flutter_sidebar_stack/ui/pages/rtlh_page.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  BacklogClickedEvent,
  RtlhClickedEvent,
  PengembangClickedEvent,
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
      case NavigationEvents.PengembangClickedEvent:
        yield PengembangPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}