/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Particles 2.0
import fbitem 1.0

Rectangle {
    id: root
    property alias multisample: fbitem.multisample
    property bool translucency: false

    gradient: Gradient {
        id: grad
        GradientStop { position: 0; color: "steelblue" }
        GradientStop { position: 1; color: "black" }
    }

    onTranslucencyChanged: {
        if (translucency) {
            root.color = "transparent";
            root.gradient = null;
        } else {
            root.color = "white";
            root.gradient = grad;
        }
    }

    ParticleSystem {
        anchors.fill: parent
        running: true

        ImageParticle {
            source: "qrc:///particleresources/glowdot.png"
            alpha: 0
            colorVariation: 1
        }

        Emitter {
            anchors.fill: parent
            lifeSpan: 3000
            emitRate: 30
            size: 50
            sizeVariation: 10
            velocity: PointDirection { xVariation: 10; yVariation: 10; }
            acceleration: PointDirection {
                y: -10
                xVariation: 5
                yVariation: 5
            }
        }
    }

    FbItem {
        id: fbitem
        anchors.fill: parent
        SequentialAnimation on eye.y {
            loops: Animation.Infinite
            NumberAnimation {
                from: 0
                to: 0.15
                duration: 1000
            }
            NumberAnimation {
                from: 0.15
                to: 0
                duration: 2000
            }
        }
        SequentialAnimation on eye.x {
            loops: Animation.Infinite
            NumberAnimation {
                from: 0
                to: -0.5
                duration: 3000
            }
            NumberAnimation {
                from: -0.5
                to: 0.5
                duration: 3000
                easing.type: Easing.OutQuad
            }
            NumberAnimation {
                from: 0.5
                to: 0
                duration: 1000
            }
        }
        SequentialAnimation on rotation.y {
            loops: Animation.Infinite
            NumberAnimation {
                from: 0
                to: 360
                duration: 5000
            }
            NumberAnimation {
                from: 360
                to: 0
                duration: 2500
            }
        }
        SequentialAnimation on rotation.x {
            loops: Animation.Infinite
            NumberAnimation {
                from: 0
                to: 360
                duration: 6000
            }
            NumberAnimation {
                from: 360
                to: 0
                duration: 3000
            }
        }
    }
}
