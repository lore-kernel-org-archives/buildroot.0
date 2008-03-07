From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 7 Mar 2008 01:09:31 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
References: <20080306181632.4CC1B1201F9@busybox.net>
Message-ID: <051a01c87feb$16251430$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




> Author: ninevoltz
> Date: 2008-03-06 10:16:30 -0800 (Thu, 06 Mar 2008)
> New Revision: 21208
> 
> Log:
> updated libxml2 makefile
> 
> Modified:
>   trunk/buildroot/package/libxml2/libxml2.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/libxml2/libxml2.mk
> ===================================================================
> --- trunk/buildroot/package/libxml2/libxml2.mk 2008-03-06 18:16:05 UTC (rev 21207)
> +++ trunk/buildroot/package/libxml2/libxml2.mk 2008-03-06 18:16:30 UTC (rev 21208)
> @@ -4,107 +4,26 @@
> #
> #############################################################
> 
> -LIBXML2_VERSION=2.6.29
> -LIBXML2_SOURCE=libxml2-sources-$(LIBXML2_VERSION).tar.gz
> -LIBXML2_SITE=ftp://xmlsoft.org/libxml2
> -LIBXML2_DIR=$(BUILD_DIR)/libxml2-$(LIBXML2_VERSION)
> -LIBXML2_CAT:=$(ZCAT)
> +LIBXML2_VERSION = 2.6.29
> +LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
> +LIBXML2_SITE = ftp://xmlsoft.org/libxml2
> +LIBXML2_AUTORECONF = NO
> +LIBXML2_INSTALL_STAGING = YES
> +LIBXML2_INSTALL_TARGET = YES
> 

Please don't  add extra whitespace like this, or you
get Bernhard on your case faster than boiled aspargus.

Best Regards
Ulf Samuelsson 
