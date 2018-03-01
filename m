From: Julia Ding <dingtasiling@gmail.com>
Date: Wed, 28 Feb 2018 20:40:39 -0700 (MST)
Subject: [Buildroot] QT5 camera error: Unknown module(s) in QT: multimedia
 multimediawidgets
Message-ID: <1519875639555-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I run qt camera demo, and it show this error

:-1: error: Unknown module(s) in QT: multimedia multimediawidgets

So I add qt5multimedia. (I'm using 'imx6-sabresd_qt5_defconfig' +
qt5multimedia.)
Then, build. Show this error:

Makefile:179: recipe for target 'sub-plugins-make_first' failed
make[3]: *** [sub-plugins-make_first] Error 2
Makefile:46: recipe for target 'sub-src-make_first' failed
make[2]: *** [sub-src-make_first] Error 2

How to fix this? Thanks.



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
