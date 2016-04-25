From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 14:07:48 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <1461442370-22393-1-git-send-email-ubaldo@eja.it> (Ubaldo
 Porcheddu's message of "Sat, 23 Apr 2016 20:12:50 +0000")
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
Message-ID: <871t5triwb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:

 > Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>

Committed after expanding the commit message, thanks.

I've also committed a change to sync the kernel version with what is
used for rpi1/2 (E.G. the rpi-4.4.y branch). Care to verify that
everything works correctly after that?

What about the serial console? The rpi3 afaik uses ttyS0 instead of
ttyAMA0 for the (default) serial console. Do we need to adjust
cmdline.txt for the rpi?

I see notes about newer rpi-firmware versions fixing up ttyAMA0 -> ttyS0
when running on a rpi3, so perhaps it isn't needed?

https://github.com/RPi-Distro/repo/issues/22

-- 
Bye, Peter Korsgaard
