From: gomsis <tuzaklirefik@gmail.com>
Date: Sat, 8 Jul 2017 03:47:43 -0700 (PDT)
Subject: [Buildroot] could not open egl display on imx6dl board
Message-ID: <1499510863874-170361.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello 

I stuck when I want to run QT examples. first I suppose it was caused by the
webengine patch but it wasn't. I tied to use QT example hellogl2, again it
gives same error "Could not open egl display". I have asked several question
on buildroot mailing list, nxp imx community, and read QT forums. some
solutions work for others. however the error still exists on my rootfs.
links are from my questions and forums that I searched. 

http://buildroot-busybox.2317881.n4.nabble.com/the-problem-with-Xorg-QT5-and-imx-vivant-dirver-td142006.html#a168690
http://buildroot-busybox.2317881.n4.nabble.com/RFC-0-3-Qt-WebEngine-support-td160642.html#a168692
https://forum.qt.io/topic/73383/could-not-open-egl-display/12
https://forum.qt.io/topic/75316/qt5-8-for-arm-could-not-open-egl-display/17
https://community.nxp.com/message/919425
https://community.nxp.com/thread/380814?start=0&tstart=0
https://bugreports.qt.io/browse/QTBUG-61156
http://www.qtcentre.org/threads/66383-EGLFS-Could-not-open-egl-display

is there a bug on QT or GPU driver on imx6dl? or Am I doing something wrong
while building rootfs? 

best regads. 



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/could-not-open-egl-display-on-imx6dl-board-tp170361.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
