import 'package:newsappclone/ui/views/bottomnavigation/main_navigation_view.dart';
import 'package:newsappclone/viewmodel/bottomnavigation/home_navigation_viewmodel.dart';
import "package:stacked/stacked_annotations.dart";
import "package:stacked_services/stacked_services.dart";
@StackedApp(
  routes: [
    MaterialRoute(page: MainView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HomeNavigationViewModel),
  ],
)
class AppSetup {
}
