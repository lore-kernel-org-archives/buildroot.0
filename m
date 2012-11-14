From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 14 Nov 2012 23:07:07 +0800
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <20121114153158.5de351df@skate>
References: <k7vnmj$27j$1@ger.gmane.org>
	<20121114153158.5de351df@skate>
Message-ID: <CAAsE_ucj6X_iaAFbLYXo4DWCiFPSpkvhZz7DYE7fspTT6f3+sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? 2012-11-14 PM10:32?"Thomas Petazzoni" <thomas.petazzoni@free-electrons.com
>???
>
> Dear woody,
>
> On Wed, 14 Nov 2012 17:19:15 +0800, woody wrote:
>
> > I want to build kernel version 2.6.16 for ARM (s3c2410).  The 2.6.16 is
>
> Why 2.6.16 ? This is prehistory.

I tried this is just because I got compiling error with other 2.6 kernel
versions listed in buildroot kernel versions selection list.
The error with those kernels is from lcd_backlight.c, saying a function
reference is not declared.

>
> > not listed in either tool chains kernel headers options list or kernel
> > version options list.  What I can do is manual specify the version via
> > the buildroot menus.  However, it then failed in a stable of buidling
> > toolchain, it complains that there is no a '.config' found under the
> > kernel source directory and also not found the "headers_install"
targets.
> >
> > I've already manually downloaded the 2.6.16 tarball to the correct
> > location that can be found by buildroot.
> >
> > So, what should I do?  Is may method wrong?
>
> Please post your Buildroot .config file and put your entire build log
> on some pastebin site (http://pastebin.com for example).
>

I will fist try some other pepople's suggestions in the thread to use the
2.6.20 kernel. If things still go bad, I will post detail info as you
suggested. Now I just lost the log.  But I thank you very much!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121114/e4f64d65/attachment.html>
