From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Sep 2012 17:43:02 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-intel: bump version
In-Reply-To: <20120922194153.43B029967A@busybox.osuosl.org>
References: <20120922194153.43B029967A@busybox.osuosl.org>
Message-ID: <20120923174302.18d54928@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 22 Sep 2012 21:34:54 +0200, Peter Korsgaard wrote:

> -XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.13.0
>  XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
>  XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
>  XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES

I haven't looked exactly, but it seems that the patches have been
removed, so maybe the AUTORECONF is no longer useful here?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
