#include "mainwindow.h"
#include <QApplication>
#include <QFile>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

	QFile qss("../theme/test.qss");
	qss.open(QFile::ReadOnly);
	if (qss.isOpen())
	{
		qDebug()<<"open";
	}
	else
	{
		qDebug()<<"no open";
	}
	qApp->setStyleSheet(qss.readAll());
    MainWindow w;
    w.show();
    
    return a.exec();
}
