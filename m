From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 13:17:21 +0200
Subject: [Buildroot] [PATCH v1 0/5] Raspberry Pi update
In-Reply-To: <20181012210941.21515-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 12 Oct 2018 23:09:36 +0200")
References: <20181012210941.21515-1-ps.report@gmx.net>
Message-ID: <87in23o3we.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Update configs/raspberrypi*, rpi-firmware, rpi-userland, rpi-bt-firmware
 > and rpi-wifi-firmware to latest versions.

 > Tested on Raspberry Pi 3 Model B v1.2 hardware:
 > - raspberrypi3_defconfig updated to glibc, systemd, gcc-8.x and
 >   qt5 (linuxfb, eglfs)


 > Peter Seiderer (5):
 >   configs/raspberrypi*: bump kernel version to 6d27aa156c
 >   rpi-firmware: bump version to fbad6408c4
 >   rpi-userland: bump version to 8f0abfb07b
 >   rpi-bt-firmware: bump version to 8c1e2bff1d
 >   rpi-wifi-firmware: bump version to 8c1e2bff1d

Committed series, thanks.

-- 
Bye, Peter Korsgaard
