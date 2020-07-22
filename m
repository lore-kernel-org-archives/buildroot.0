From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:09:51 +0200
Subject: [Buildroot] [PATCH v1] board/raspberrypi: fix rpi4/rpi4-64
 genimage config files
In-Reply-To: <20200714201750.22289-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 14 Jul 2020 22:17:50 +0200")
References: <20200714201750.22289-1-ps.report@gmx.net>
Message-ID: <87pn8oja9s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Since commit 'package/rpi-firmware: fix startup file names' ([1]) the
 > start and fixup file names are normalized to start.elf/fixup.dat,
 > adjust the rpi4 genimage config files accordingly.

 > Fixes:

 >   ERROR: file(rpi-firmware/fixup4.dat): stat(.../images/rpi-firmware/fixup4.dat) failed: No such file or directory
 >   ERROR: vfat(boot.vfat): could not setup rpi-firmware/fixup4.dat

 > [1] https://git.buildroot.net/buildroot/commit/?id=1bdc0334ff6273761b2e7fda730cdcc7e1f46862

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
