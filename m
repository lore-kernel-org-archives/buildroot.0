From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Nov 2012 15:31:58 +0100
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <k7vnmj$27j$1@ger.gmane.org>
References: <k7vnmj$27j$1@ger.gmane.org>
Message-ID: <20121114153158.5de351df@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear woody,

On Wed, 14 Nov 2012 17:19:15 +0800, woody wrote:

> I want to build kernel version 2.6.16 for ARM (s3c2410).  The 2.6.16 is

Why 2.6.16 ? This is prehistory.
 
> not listed in either tool chains kernel headers options list or kernel 
> version options list.  What I can do is manual specify the version via 
> the buildroot menus.  However, it then failed in a stable of buidling 
> toolchain, it complains that there is no a '.config' found under the 
> kernel source directory and also not found the "headers_install" targets.
> 
> I've already manually downloaded the 2.6.16 tarball to the correct 
> location that can be found by buildroot.
> 
> So, what should I do?  Is may method wrong?

Please post your Buildroot .config file and put your entire build log
on some pastebin site (http://pastebin.com for example).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
