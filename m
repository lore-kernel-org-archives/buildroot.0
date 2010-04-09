From: Muhammed ER <er.muhammed@gmail.com>
Date: Fri, 9 Apr 2010 11:37:10 +0300
Subject: [Buildroot] Qt IBase error
Message-ID: <n2jf70863321004090137qa0f54bb7w8708b78e95bb47ce@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am using Buildroot on mini2440 board. I need to use SQL in Qt. When I add
IBASE in Qt, It gives me this error message;

-------------------------------------------------------------------------------------------------------
This is the Qt for Embedded Linux Open Source Edition.

You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.
You are also licensed to use this software under the terms of
the GNU General Public License (GPL) versions 3.

You have already accepted the terms of the  license.

Creating qmake. Please wait...
make[1]: Entering directory
`/media/disk/derleme/Buildroot/buildroot-20100409/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
make[1]: Leaving directory
`/media/disk/derleme/Buildroot/buildroot-20100409/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
InterBase support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: ***
[/media/disk/derleme/Buildroot/buildroot-20100409/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
Error 10
----------------------------------------------------------------------------------------------------------

Any advise is accepted.
Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100409/72b4a041/attachment.htm>
