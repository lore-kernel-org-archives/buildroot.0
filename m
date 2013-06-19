From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 17:43:42 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
 use udev environment variables instead
In-Reply-To: <20130619174320.464b740b@skate>
References: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
 <20130619164656.33bc3f8c@skate> <1371653634.3873.13.camel@sven>
 <20130619171702.4d5a5e6b@skate> <1371656552.3873.16.camel@sven>
 <20130619174320.464b740b@skate>
Message-ID: <20130619174342.0b07d122@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 19 Jun 2013 17:43:20 +0200, Thomas Petazzoni wrote:

> This dependency already exists in udev:
> 
> config BR2_PACKAGE_UDEV
>         bool "udev"
>         depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>         depends on BR2_LARGEFILE # util-linux
>         depends on BR2_USE_WCHAR # util-linux
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>         select BR2_PACKAGE_KMOD
> 
> My point was really about util-linux itself.

My point was really about *usbmount* itself.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
