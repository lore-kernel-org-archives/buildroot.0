From: Massimiliano Marretta <max@marretta.com>
Date: Mon, 24 Feb 2014 09:53:29 +0100
Subject: [Buildroot] Qt5 with Linaro toolchain
Message-ID: <CACP2RPbPH9uZ2ReBstvdM-bjN-i5FCN=UA8SwCCoG1C3w4xvWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I build buildroot-2013.11 with the linaro 4.7 2013.01 I have some
problem with Qt5. All the .pro file with inside
declare "option(host_build)" fail.
The make file created with "option(host_build)" set CC variable to gcc
instead of arm-linux-gnueabihf-gcc. This is correct ?

Regards,
Massimiliano Marretta
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140224/61c7ae56/attachment.html>
