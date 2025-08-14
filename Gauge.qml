// Gauge.qml — Qt 6 compatible, no Extras/Styles/GraphicalEffects
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Item {
    id: root
    width: 220
    height: 220

    // Public API
    property real value: 0
    property real minimumValue: 0
    property real maximumValue: 8000
    property string units: "RPM"
    property string label: "Tachometer"

    // Look & feel
    property color dialColor: "#1b1e22"
    property color arcBackground: "#334a4a4a"
    property color arcForeground: "#26c281"
    property color tickColor: "#b0b0b0"
    property color needleColor: "#ff5252"
    property color textColor: "#ffffff"

    // Sweep (degrees). 0° is right (+X), positive CCW.
    property real startAngle: -210
    property real endAngle: 30

    // Geometry helpers
    readonly property real radius: Math.min(width, height) * 0.48
    readonly property real cx: width / 2
    readonly property real cy: height / 2
    readonly property real clamped: Math.max(minimumValue, Math.min(maximumValue, value))
    readonly property real t: (clamped - minimumValue) / Math.max(1e-6, (maximumValue - minimumValue))
    readonly property real angle: startAngle + t * (endAngle - startAngle)

    // Smooth value animation
    Behavior on value { NumberAnimation { duration: 120; easing.type: Easing.InOutQuad } }

    Rectangle {
        width: radius * 2; height: radius * 2
        radius: width / 2
        anchors.centerIn: parent
        color: dialColor
        border.color: "#202225"; border.width: 1
    }

    // Background arc (full sweep)
    Shape {
        anchors.fill: parent; antialiasing: true; layer.enabled: true
        ShapePath {
            strokeWidth: 14; strokeColor: root.arcBackground; fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            startX: cx + radius * Math.cos(startAngle * Math.PI/180)
            startY: cy + radius * Math.sin(startAngle * Math.PI/180)
            PathArc {
                x: cx + radius * Math.cos(endAngle * Math.PI/180)
                y: cy + radius * Math.sin(endAngle * Math.PI/180)
                radiusX: radius; radiusY: radius
                useLargeArc: (Math.abs(endAngle - startAngle) > 180)
                direction: PathArc.Counterclockwise
            }
        }
    }

    // Foreground arc (current value)
    Shape {
        anchors.fill: parent; antialiasing: true; layer.enabled: true
        ShapePath {
            strokeWidth: 14; strokeColor: root.arcForeground; fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            startX: cx + radius * Math.cos(startAngle * Math.PI/180)
            startY: cy + radius * Math.sin(startAngle * Math.PI/180)
            PathArc {
                x: cx + radius * Math.cos(angle * Math.PI/180)
                y: cy + radius * Math.sin(angle * Math.PI/180)
                radiusX: radius; radiusY: radius
                useLargeArc: (Math.abs(angle - startAngle) > 180)
                direction: PathArc.Counterclockwise
            }
        }
    }

    // Major ticks
    Repeater {
        id: tickRepeater; model: 9
        delegate: Rectangle {
            readonly property real frac: index / (tickRepeater.model - 1)
            readonly property real a: startAngle + frac * (endAngle - startAngle)
            width: 2; height: 12; radius: 1; color: tickColor
            x: cx + (radius - 12) * Math.cos(a * Math.PI/180) - width/2
            y: cy + (radius - 12) * Math.sin(a * Math.PI/180) - height/2
            rotation: a + 90; transformOrigin: Item.Center
        }
    }

    // Needle + hub
    Rectangle {
        width: 4; height: radius - 20; radius: 2
        color: needleColor; anchors.centerIn: parent
        rotation: angle + 90; transformOrigin: Item.Bottom; antialiasing: true
    }
    Rectangle {
        width: 14; height: 14; radius: 7
        color: "#eeeeee"; border.color: "#222"
        anchors.centerIn: parent; antialiasing: true
    }

    // Readouts
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom; anchors.bottomMargin: 18
        spacing: 2
        Text {
            text: Number(Math.round(clamped)).toLocaleString(Qt.locale()) + " " + units
            color: textColor; font.pixelSize: 18; horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: label; color: textColor; opacity: 0.8; font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
