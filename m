From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 16:33:13 +0100
Subject: [Buildroot] Update of toolchains for autobuild.b.o
Message-ID: <20150315163313.65d413e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just done a round of update in the Buildroot toolchain
configurations used on autobuild.b.o:

 * All pre-built Buildroot toolchains have been rebuilt with Buildroot
   2015.02 (except the SH4 toolchain, since it doesn't build in recent
   Buildroot)

 * Added an ARC external toolchain. The intent here is mainly to have
   an easily available pre-built ARC toolchain.

 * Added a Xtensa external toolchain. Same idea.

 * Added a Buildroot external toolchain built by Buildroot.

 * Added an ARM Musl based toolchain. This is probably the biggest
   change, and will most likely cause a fairly significant number of
   build failures.

 * Changed the ARM internal Buildroot toolchain configuration to use
   uClibc-ng instead of uClibc 0.9.33.

If you see other useful updates to be done in the autobuilder
configurations, please let me know.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
