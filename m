From: hartleys <hartleys@visionengravers.com>
Date: Tue, 17 Jun 2008 21:48:45 -0400
Subject: [Buildroot] Problem building usbutils
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm having a couple problems getting usbutils to build with buildroot.

1) usbutils requires libusb
This was the easy one. I just needed to select the libusb package. But,
shouldn't the Config.in for usbutils select it automatically?

2) configure for usbutils outputs error: get libusb 0.1.8 or newer
Not sure how to fix this one. The libusb in buildroot is 0.1.12. It
built fine and the library is in my build_arm/staging_dir/usb/lib
directory. For some reason it's not being found. Can anyone offer so
insite on what I might have setup wrong?

Thanks,
Hartley
