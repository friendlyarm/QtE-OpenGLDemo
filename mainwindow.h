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


#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QWidget>
#include <QQuickWidget>
#include <QQuickView>
#include <QPushButton>
#include <QMessageBox>
#include "mainwidget.h"
QT_FORWARD_DECLARE_CLASS(QLayout)

class TMainWindow : public QWidget
{
public:
    TMainWindow(bool transparency);
private:
    void resizeEvent(QResizeEvent*);

private:
    QQuickWidget *quickWidget;
    TMainWidget* mainWidget;

    QTimer* mpKeepAliveTimer;
};

#endif
