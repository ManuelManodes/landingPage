import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/router/router_handlers.dart';

class fluroRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define('/:page', handler: homeHandler);

    router.notFoundHandler = homeHandler;
  }
}
