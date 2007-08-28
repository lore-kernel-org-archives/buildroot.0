From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Wed, 29 Aug 2007 00:09:40 +0200 (CEST)
Subject: [Buildroot] rxvt-package for all x11-versions
In-Reply-To: <20070828211941.GB11697@aon.at>
References: <f90898420708280735q1852713eh4a6c1846fc8d827d@mail.gmail.com>
	<20070828211941.GB11697@aon.at>
Message-ID: <0708290006560.9733@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Aug 2007, Bernhard Fischer wrote:

> Given that the filesystem standard nowadays seem to mandate that all X11
> apps should go into /usr, it would be way better to add one central
> config BR2_X11_PREFIX
> 	string "/usr/X11R6" if BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
> 	string "/usr" if !BR2_PACKAGE_XSERVER_xorg && !BR2_PACKAGE_XSERVER_tinyx
> in package/Makefile.in, below the XSERVER settings.

Is it not so that with xorg all that X11R6 is gone? For example on my
debian unstable:

  /usr/X11R6/bin -> ../bin/


Cheers,

-- 
Cristian
