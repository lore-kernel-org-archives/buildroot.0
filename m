From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:02:16 +0200
Subject: [Buildroot] Buildroot pre-built toolchains updated
Message-ID: <20160807220216.158e1483@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have updated the pre-built Buildroot toolchains used by
autobuild.buildroot.org. They are now built with 2016.08-rc1, on top of
which I've added two patches:

  bfin: fix two issues with internal toolchain
  uclibc: proper thread default on m68k and Microblaze

that have not yet been applied to master.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
