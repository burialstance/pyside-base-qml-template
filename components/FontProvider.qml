import QtQuick 2.12


Item {
    id: provider

    FontLoader {
        id: robotoLight
        source: '../resources/fonts/Roboto-Light.ttf'
    }
    FontLoader {
        id: robotoMedium
        source: '../resources/fonts/Roboto-Medium.ttf'
    }
    FontLoader {
        id: robotoRegular
        source: '../resources/fonts/Roboto-Regular.ttf'
    }
    readonly property string light: robotoLight.name
    readonly property string medium: robotoMedium.name
    readonly property string regular: robotoRegular.name


    // https://material.io/design/typography/the-type-system.html#type-scale

    property font h1: Qt.font({pixelSize: 96, family: light, letterSpacing: -1.5})
    property font h2: Qt.font({pixelSize: 60, family: light, letterSpacing: -0.5})
    property font h3: Qt.font({pixelSize: 48, family: regular, letterSpacing: 0})
    property font h4: Qt.font({pixelSize: 34, family: regular, letterSpacing: 0.25})
    property font h5: Qt.font({pixelSize: 24, family: regular, letterSpacing: 0})
    property font h6: Qt.font({pixelSize: 20, family: medium, letterSpacing: 0.15})

    property font subTitle1: Qt.font({pixelSize: 16, family: regular, letterSpacing: 0.15})
    property font subTitle2: Qt.font({pixelSize: 14, family: medium, letterSpacing: 0.1})

    property font body1: Qt.font({pixelSize: 16, family: regular, letterSpacing: 0.5})
    property font body2: Qt.font({pixelSize: 14, family: regular, letterSpacing: 0.25})

    property font button: Qt.font({pixelSize: 14, family: medium, letterSpacing: 1.25, capitalization: Font.AllUppercase})

    property font caption: Qt.font({pixelSize: 12, family: regular, letterSpacing: 0.4})
    property font overline: Qt.font({pixelSize: 10, family: regular, letterSpacing: 1.5, capitalization: Font.AllUppercase})

}




