From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 21:07:22 +0200
Subject: [Buildroot] Update of pre-built Buildroot toolchains
Message-ID: <20160921210722.1b078ab1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just deployed a new set of pre-build Buildroot toolchains in the
autobuilders. The toolchains have all been rebuilt as of commit
589cbc61b0913891fd00019365e52b9e50ff7250. Major changes are:

 * Almost all toolchains have been switched to the default of gcc 5.x.
   There are still a few toolchains that intentionally use different
   gcc version: some using gcc 6.x, some using gcc 4.8.x.

 * The ARC toolchain has been updated with the latest version of the
   ARC toolchain components.

 * The Blackfin toolchain has the latest uClibc fix.

 * The musl toolchains now have TLS enabled thanks to the rework of the
   TLS handling.

 * The bleeding edge toolchain (br-arm-cortex-a9-glibc) has been updated
   to use binutils 2.27 and glibc 2.24. It continues to use gcc 6.x, of
   course.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
