import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import PageEnum 1.0
import Style 1.0

import "./"
import "../Controls2"
import "../Controls2/TextTypes"
import "../Config"

PageType {
    id: root

    defaultActiveFocusItem: focusItem

    FlickableType {
        id: fl
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        contentHeight: content.height

        ColumnLayout {
            id: content

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 0

            Item {
                id: focusItem
                KeyNavigation.tab: backButton
            }

            BackButtonType {
                id: backButton
                Layout.topMargin: 20
//                KeyNavigation.tab: fileButton.rightButton
            }

            HeaderType {
                Layout.fillWidth: true
                Layout.topMargin: 8
                Layout.rightMargin: 16
                Layout.leftMargin: 16
                Layout.bottomMargin: 32

                headerText: qsTr("VPN by Amnezia")
                descriptionText: qsTr("Choose a VPN service that suits your needs.")
            }

            ListView {
                id: containers
                width: parent.width
                height: containers.contentItem.height
                spacing: 16

                currentIndex: 1
                interactive: false
                model: ApiServicesModel

                delegate: Item {
                    implicitWidth: containers.width
                    implicitHeight: delegateContent.implicitHeight

                    ColumnLayout {
                        id: delegateContent

                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right

                        CardWithIconsType {
                            id: card

                            Layout.fillWidth: true
                            Layout.rightMargin: 16
                            Layout.leftMargin: 16

                            headerText: name
                            bodyText: cardDescription
                            footerText: price

                            rightImageSource: "qrc:/images/controls/chevron-right.svg"

                            onClicked: {
                                ApiServicesModel.setServiceIndex(index)
                                PageController.goToPage(PageEnum.PageSetupWizardApiServiceInfo)
                            }
                        }
                    }
                }
            }
        }
    }
}
