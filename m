From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Mar 2012 11:38:52 +0200
Subject: [Buildroot] DirectFB backend of Gtk?
In-Reply-To: <1332838194-3638-2-git-send-email-yegorslists@googlemail.com>
References: <1332838194-3638-1-git-send-email-yegorslists@googlemail.com>
 <1332838194-3638-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20120327113852.6801b8f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 27 Mar 2012 10:49:54 +0200,
yegorslists at googlemail.com a ?crit :

> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index 977d272..071cdf4 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  DIRECTFB_VERSION_MAJOR = 1.4
> -DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).15
> +DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).16
>  DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
>  DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
>  DIRECTFB_AUTORECONF = YES

By any chance, are you using the DirectFB backend of Gtk? We have some
build failures with it:
http://autobuild.buildroot.org/results/e6e611073582ae59ef9a7cb66415b998e6b815f4/.

If someone could have a look at this, it would be nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
