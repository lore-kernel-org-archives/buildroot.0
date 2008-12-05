From: Gaye Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Fri, 05 Dec 2008 11:42:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
In-Reply-To: <20081205102252.8B86A3C799@busybox.net>
References: <20081205102252.8B86A3C799@busybox.net>
Message-ID: <49390579.7040600@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-12-05 02:22:52 -0800 (Fri, 05 Dec 2008)
> New Revision: 24282
>
> Log:
> libusb: use 0.1.12-10 from snapshot.debian.net
>
> Modified:
>    trunk/buildroot/package/libusb/libusb.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/libusb/libusb.mk
> ===================================================================
> --- trunk/buildroot/package/libusb/libusb.mk	2008-12-05 09:47:16 UTC (rev 24281)
> +++ trunk/buildroot/package/libusb/libusb.mk	2008-12-05 10:22:52 UTC (rev 24282)
> @@ -4,10 +4,9 @@
>  #
>  #############################################################
>  LIBUSB_VERSION:=0.1.12
> -LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-12.diff.gz
> +LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-10.diff.gz
>  LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
> -#LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
> -LIBUSB_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libu/libusb
> +LIBUSB_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/libu/libusb
>  LIBUSB_DIR:=$(BUILD_DIR)/libusb-$(LIBUSB_VERSION)
>  LIBUSB_CAT:=$(ZCAT)
>  LIBUSB_BINARY:=usr/lib/libusb.so
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>   
Hello,
As I said in a moderated message (due to build log) libusb_0.1.12-13 
build here (see moderated message)
