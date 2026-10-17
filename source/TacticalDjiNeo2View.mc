import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Application;

class TacticalDjiNeo2View extends WatchUi.WatchFace {
    var bg;
    function initialize() { WatchFace.initialize(); }
    
    function onLayout(dc as Dc) {
        bg = Application.loadResource(Rez.Drawables.background);
    }

    function onUpdate(dc as Dc) {
        var w = dc.getWidth();
        var h = dc.getHeight();
        var cx = w/2;
        var cy = h/2;
        var time = System.getClockTime();

        // 1. TŁO
        dc.drawBitmap(0,0,bg);

        // 2. 5 PUNKTÓW - TU ZMIENIASZ WARTOŚCI
        // Punkt 1 - lewa góra - TĘTNO
        drawPoint(dc, w*0.28, h*0.32, "72", "TĘTNO", Graphics.COLOR_RED);
        // Punkt 2 - prawa góra - POGODA
        drawPoint(dc, w*0.72, h*0.32, "12°", "POGODA", Graphics.COLOR_BLUE);
        // Punkt 3 - lewy dół - KROKI
        drawPoint(dc, w*0.28, h*0.70, "8426", "KROKI", Graphics.COLOR_GREEN);
        // Punkt 4 - prawy dół - BATERIA
        drawPoint(dc, w*0.72, h*0.70, "85%", "BATERIA", Graphics.COLOR_YELLOW);
        // Punkt 5 - środek dół - DATA
        drawPoint(dc, w*0.50, h*0.85, "SOB 18", "PAŹ", Graphics.COLOR_PURPLE);

        // 3. WSKAZÓWKI
        var hourAngle = (time.hour % 12) * 30 + time.min * 0.5 - 90;
        var minAngle = time.min * 6 - 90;
        var secAngle = time
