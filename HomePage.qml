import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Page {
    header: Pane {
        background: Rectangle {
            anchors.fill: parent
            color: Qt.darker(Material.background, 1.33)
        }

        Column {
            height: 48 * 3
            Label {
                font: fonts.h3
                text: 'HomePage'
            }
            Label {
                font: fonts.subTitle1
                text: 'https://github.com/burialstance/pyside-qml-material-template'
                color: Qt.darker(Material.foreground, 1.66)
            }
        }

    }

}
