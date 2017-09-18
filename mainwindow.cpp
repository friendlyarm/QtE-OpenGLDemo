// Copyright (C) Guangzhou FriendlyARM Computer Tech. Co., Ltd.
// (http://www.friendlyarm.com)
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, you can access it online at
// http://www.gnu.org/licenses/gpl-2.0.html.


#include "mainwindow.h"
#include "fbitem.h"
#include <QCoreApplication>
#include <QVBoxLayout>
#include <QGroupBox>
#include <QRadioButton>
#include <QCheckBox>
#include <QLabel>
#include "util.h"
#include "sys/sysinfo.h"
#include "boardtype_friendlyelec.h"

TMainWindow::TMainWindow(bool transparency)
	: QWidget()
{
    qmlRegisterType<FbItem>("fbitem", 1, 0, "FbItem");

    QSurfaceFormat format;
    format.setDepthBufferSize(16);
    format.setStencilBufferSize(8);
    if (transparency)
        format.setAlphaBufferSize(8);


    QUrl source("qrc:qquickviewcomparison/test.qml");
    quickWidget = new QQuickWidget(this);
    if (transparency)
        quickWidget->setClearColor(Qt::transparent);
    quickWidget->setFormat(format);
    quickWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    quickWidget->setSource(source);
    quickWidget->setFocus();

    mainWidget = new TMainWidget(this, true, "https://github.com/friendlyarm/QtE-OpenGLDemo.git");
    mainWidget->setAttribute(Qt::WA_TranslucentBackground);
    mainWidget->setAttribute(Qt::WA_NoSystemBackground, true);
    mainWidget->raise();
}

void TMainWindow::resizeEvent(QResizeEvent*) {
    quickWidget->setGeometry(0,0,width(),height());
    mainWidget->setGeometry(0,0,width(),height());
}


