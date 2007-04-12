From: gernot at kvas.at <gernot@kvas.at>
Date: Thu, 12 Apr 2007 19:00:16 +0200
Subject: [Buildroot] Building external modules
Message-ID: <20070412190016.e4i0x2reg4vko48w@www.kvas.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Is there a "best practice" to include external modules in buildroot,  
get them built and insert them at the right spot in the rootfs?

I currently maintain my own board in target/device. It downloads and  
builds its own kernel, so I have the source for Kbuild to build  
against. I'm just wondering if somebody has done it before, as I  
assume that especially embedded system need some exotic drivers.

Cheers,

Gernot
