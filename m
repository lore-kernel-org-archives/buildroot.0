From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 15:33:22 +0200
Subject: [Buildroot] Anyone interested in the AVR32 architecture?
Message-ID: <20140406153322.3c71b9ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Almost two months ago, Simon Dawson, said he would no longer have the
possibility of maintaining the AVR32 support in Buildroot, and was
asking whether someone could step up to continue maintaining this
architecture. Two months later, there has been no volunteer to do that.

The AVR32 architecture is problematic, because it is been abandoned by
Atmel, there is no upstream support in many of the toolchain components
(binutils, gcc, etc.), the uClibc support only works with the old
uClibc 0.9.31, a number of packages are having issues on AVR32 due to
these problems.

Therefore, unless someone steps up to maintain the AVR32 architecture
moving forward, I'm proposing to mark this architecture as deprecated
for the 2014.05 release. It will not be removed at this point, but it
will no longer be visible by default from menuconfig, and we will stop
doing autobuilder testing for this architecture.

So to sum up: if you're interested in AVR32, please speak up, now!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
