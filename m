From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 10:46:06 +0200
Subject: [Buildroot] Problem building usbutils
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Tue\,
	17 Jun 2008 21\:48\:45 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com>
Message-ID: <871w2v9lm9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> 1) usbutils requires libusb This was the easy one. I just
 hartleys> needed to select the libusb package. But, shouldn't the
 hartleys> Config.in for usbutils select it automatically?

Yes, fixed in trunk.

 hartleys> 2) configure for usbutils outputs error: get libusb 0.1.8
 hartleys> or newer Not sure how to fix this one. The libusb in
 hartleys> buildroot is 0.1.12. It built fine and the library is in my
 hartleys> build_arm/staging_dir/usb/lib directory. For some reason
 hartleys> it's not being found. Can anyone offer so insite on what I
 hartleys> might have setup wrong?

Strange, it builds here (i386).

Could you provide more details, please?

-- 
Bye, Peter Korsgaard
