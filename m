From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 12:39:11 +0200
Subject: [Buildroot] Autobuilder toolchain update: Blackfin and ARC
Message-ID: <20160820123911.3a5aad40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

FYI, I have rebuilt the Blackfin and ARC pre-built Buildroot toolchains
for the autobuilders. The changes are:

 * Rebuilt with 2016.08-rc2 + the Blackfin toolchain fixes + the uClibc
   ARC fix (runtime only, but since I was going to rebuild anyway)

 * C++ is now re-enabled for Blackfin with the Buildroot toolchain.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
