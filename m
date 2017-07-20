From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:57:10 +0200
Subject: [Buildroot] Using linux-zigbee ?
Message-ID: <20170720225710.076f8086@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxime,

Back in 2014, you added the linux-zigbee package in Buildroot. However,
this project is no longer maintained, and the replacement project is
wpan-tools, for which we already have a Buildroot package.

linux-zigbee has seen no updates since 2014
(https://sourceforge.net/p/linux-zigbee/linux-zigbee/ci/38f42dbfce9e13629263db3bd3b81f14c69bb733/log/?path=).
The fork at https://github.com/linux-wpan/lowpan-tools, which only
contains two additional commits, also from 2014, clearly mentions that
this is deprecated.

In addition, linux-zigbee now fails to build with gcc 7.x:
http://autobuild.buildroot.net/results/29c/29c72bc38042305310576be945c721b2fad95894/build-end.log.

Do you still use linux-zigbee ? Or could we remove it from Buildroot in
favor of wpan-tools ?

Are there other people using linux-zigbee and not wpan-tools ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
