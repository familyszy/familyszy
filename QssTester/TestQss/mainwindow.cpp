#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFile>
#include <QDebug>
#include <QWebFrame>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

	//ok
	//ui->m_webView->setStyleSheet("background-color:rgb(150,147,88); padding: 1px ; color:rgb(255,255,255)");
	ui->m_webView->setUrl(QUrl("http://www.163.com"));

	ui->m_webView->page()->mainFrame()->setScrollBarPolicy(Qt::Horizontal, Qt::ScrollBarAlwaysOff);
	ui->m_webView->page()->mainFrame()->setScrollBarPolicy(Qt::Vertical, Qt::ScrollBarAlwaysOff);
	//ok
	ui->m_webView->page()->settings()->setUserStyleSheetUrl(QUrl::fromLocalFile("mycss.css"));

	//ui->m_webView->setStyleSheet("border: 10px groove gray; border-radius: 10px; background-color: rgba(255, 193, 245, 0%); ");
	QFile qss("test.qss");
	qss.open(QFile::ReadOnly);
	if (qss.isOpen())
	{
		qDebug()<<"open";
	}
	else
	{
		qDebug()<<"no open";
	}
	ui->m_webView->setStyleSheet(qss.readAll());
	//ui->m_webView->page()->mainFrame()->setStyleSheet(qss.readAll());
}

MainWindow::~MainWindow()
{
    delete ui;
}
