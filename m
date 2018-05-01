From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:52:57 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: qt5websockets: install missing qml
 modules
In-Reply-To: <3fc9a546-61c8-d7bf-f0eb-b757cae0dfe2@ginzinger.com> (Manfred
 Schlaegl's message of "Wed, 11 Apr 2018 14:40:37 +0200")
References: <3fc9a546-61c8-d7bf-f0eb-b757cae0dfe2@ginzinger.com>
Message-ID: <87efivooja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Manfred" == Manfred Schlaegl <manfred.schlaegl@ginzinger.com> writes:

 > QML modules for QtWebSockets are located in /usr/qml/QtWebSockets since
 > Qt 5.5.

 > /usr/qml/Qt/WebSockets still exists for compatibility reasons, but
 > it contains only a qmldir file which points to ../../QtWebSockets/.

 > see also: http://doc.qt.io/qt-5.6/qtwebsockets-qmlmodule.html

 > Signed-off-by: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
