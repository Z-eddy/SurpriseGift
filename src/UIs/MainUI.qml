import QtQuick 2.12
import QtQuick.Window 2.12
import TestButton 1.0
import TheText 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("这是个测试页面")

    TheButton{
        anchors.centerIn: parent
    }

    MyText{
    }
}
