From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jan 2016 19:56:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/openocd: select libusb when
	selecting libusb-compat
In-Reply-To: <1451664066-6127-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Fri, 1 Jan 2016 17:01:06 +0100")
References: <1451664066-6127-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87r3i1ruvf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > libusb-compat depends on libusb package, so we need to select
 > libusb package at the same time as libusb-compat to avoid an
 > unmet dependency.

 > Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
 > stop if a package build is trigged at Makefile level without
 > being selected at Config.in level.

 > This is the case here with BR2_PACKAGE_OPENOCD_USBPROG which
 > select BR2_PACKAGE_LIBUSB_COMPAT without selecting
 > BR2_PACKAGE_LIBUSB.

 > Fixes:
 > http://autobuild.buildroot.net/results/b4a/b4a8c54eed6bf75ab8ade0653953d19792155727/

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
