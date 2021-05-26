import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12


import 'components'


ApplicationWindow {
    id: root
    width: 1080
    height: 720
    visible: true
    title: qsTr("Material Template")
    //flags: Qt.WindowStaysOnTopHint

    FontProvider {
        id: fonts
    }


    Loader {
        id: contentLoader
        anchors.fill: parent
        source: Qt.resolvedUrl('HomePage.qml')
        function reloadSource(){
            var src = contentLoader.source
            contentLoader.source = ''
            qmlHotReload.clear_cache()
            contentLoader.source = src
            console.log(src + ' reloaded')
        }

    }

    Connections {
        target: qmlHotReload
        function onEventUpdate(path){
            console.log(path)
            contentLoader.reloadSource()
        }
    }



}
