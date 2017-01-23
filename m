From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:01:09 +0100
Subject: [Buildroot] [PATCH v1 0/6] Raspberry Pi update
In-Reply-To: <20170123202318.12596-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 23 Jan 2017 21:23:12 +0100")
References: <20170123202318.12596-1-ps.report@gmx.net>
Message-ID: <8760l5jv16.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Update rpi-firmware/rpi-userland and all raspberrypi?_defconfigs to
 > kernel version 4.4.43.

 > Tested on Raspberry Pi 3 Model B v1.2 hardware:
 > - raspberrypi3_defconfig
 > - raspberrypi3_defconfig updated to glibc, systemd, gcc-6.x and
 >   qt5 (linuxfb, eglfs)

Would it perhaps make sense to have a qt5/graphics demo defconfig for
rpi3?

 > PeterpSeiderer (6):
 >   raspberrypi0_defconfig: bump kernel version to 4.4.43
 >   raspberrypi_defconfig: bump kernel version to 4.4.43
 >   raspberrypi2_defconfig: bump kernel version to 4.4.43
 >   raspberrypi3_defconfig: bump kernel version to 4.4.43
 >   rpi-firmware: bump version
 >   rpi-userland: bump version

Committed entire series, thanks.

-- 
Bye, Peter Korsgaard
