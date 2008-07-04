From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 04 Jul 2008 11:54:51 +0200
Subject: [Buildroot] AVR32 toolchain reinstated
Message-ID: <486DF36B.9010208@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AVR32 external source toolchain seems to work again
using the gcc-4.2.2 compiler with patches from
www.atmel.no/buildroot (revision 2.2.0-rc4).

After a small fix in libdaemon where libtoolize seems to
replace the recently copied config.* from package/gnuconfig,
the build of the atngw100 completes generating a linux,
jffs2 and tar file systems, as well as u-boot.bin

Best Regards
Ulf Samuelsson
