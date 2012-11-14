From: woody <narkewoody@gmail.com>
Date: Wed, 14 Nov 2012 17:19:15 +0800
Subject: [Buildroot] How to build Kernel 2.6.x
Message-ID: <k7vnmj$27j$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to build kernel version 2.6.16 for ARM (s3c2410).  The 2.6.16 is 
not listed in either tool chains kernel headers options list or kernel 
version options list.  What I can do is manual specify the version via 
the buildroot menus.  However, it then failed in a stable of buidling 
toolchain, it complains that there is no a '.config' found under the 
kernel source directory and also not found the "headers_install" targets.

I've already manually downloaded the 2.6.16 tarball to the correct 
location that can be found by buildroot.

So, what should I do?  Is may method wrong?

Thanks in advance!


-- 
woody
I can't go back to yesterday - because I was a different person then.
