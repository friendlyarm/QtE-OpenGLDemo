// Copyright (C) Guangzhou FriendlyELEC Computer Tech. Co., Ltd.
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


#include <QApplication>

#include "mainwindow.h"

int main(int argc, char **argv)
{
    qputenv("QML_BAD_GUI_RENDER_LOOP", "1"); // QTBUG-39507

    QApplication app(argc, argv);

    bool transparency = QCoreApplication::arguments().contains(QStringLiteral("--transparent"));
    TMainWindow widgetWindow(transparency);
    if (transparency) {
        widgetWindow.setAttribute(Qt::WA_TranslucentBackground);
        widgetWindow.setAttribute(Qt::WA_NoSystemBackground, false);
    }

    widgetWindow.showFullScreen();

    return app.exec();
}
