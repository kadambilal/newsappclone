import 'package:newsappclone/viewmodel/bottomnavigation/home_navigation_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = StackedLocator.instance;
void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => HomeNavigationViewModel());
}
