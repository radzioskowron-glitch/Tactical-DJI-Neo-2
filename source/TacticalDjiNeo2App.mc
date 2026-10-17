import Toybox.Application;
import Toybox.WatchUi;
class TacticalDjiNeo2App extends Application.AppBase {
    function initialize() { AppBase.initialize(); }
    function getInitialView() { return [ new TacticalDjiNeo2View() ]; }
}
