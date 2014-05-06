From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 14:24:14 +0200
Subject: [Buildroot] musl support added in Buildroot
Message-ID: <20140506142414.26a431d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Buildroot (http://buildroot.org) is a popular embedded Linux build
system. We have recently (just today) added support for:

 * Building cross-toolchains with the musl C library, through what we
   call the "internal toolchain backend" (i.e Buildroot builds the
   cross compilation toolchain)

 * Using pre-existing musl cross-toolchains, as provided from
   musl.codu.org, through what we call the "external toolchain
   backend" (i.e Buildroot does not build the cross compilation
   toolchain, and relies on a pre-existing one).

Both of these features will be part of the upcoming 2014.05 release.

As part of this effort, we will be adding in the future a musl
configuration to our autobuilders (http://autobuild.buildroot.org)
which will lead to a fairly heavy testing of musl, as the 1200+
packages of Buildroot will be built against it. There are chances that
we might be reporting some issues related to this testing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
