From: Mark Currie <mark@ziliant.com>
Date: Tue, 10 Oct 2006 20:32:16 +0200
Subject: [Buildroot] Problem with libusb and g++
Message-ID: <20061010203240.B57882B0E@ctb-mesg5.saix.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to get libusb compiled with buildroot but it has some C++ code
that needs g++ to build it. So I enabled g++ in menuconfig but it seems to
ignore me and does not build the g++ library. I have tried various versions
of the relevant makefile but no joy. The only reference that I could find to
this problem suggested selecting gcc-3.3.6 instead of 3.4.4 (which I have
been using) but I have other problems building gcc-3.3.6 - firstly it
couldn't download it from the relevant site, so I manually downloaded it
from another site but while configuring, it complains about not having
arm-linux-uclibc. So I am getting further and further away from my original
problem. Does anyone have any suggestions about how I can g++ to build with
my original gcc-3.4.4 environment ?

Thanks
Markc
