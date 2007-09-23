From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 24 Sep 2007 00:18:47 +0200
Subject: [Buildroot] -qt-mouse-tslib makes Qtopia-4.3.1 fail
Message-ID: <1190585927.7015.32.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to build qtopia-4.3.1 for ARM, but it fails
when you use TSLIB and -qt-mouse-tslib is passed to configure.

-qt-mouse-tslib is not accepted, but then it says that
-qt-mouse-<pkg> is acceptable using pkg=tslib

What is going on?


Best Regards
Ulf Samuelsson
