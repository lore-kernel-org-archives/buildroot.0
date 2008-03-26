From: Simon Pasch <fpasch@googlemail.com>
Date: Wed, 26 Mar 2008 14:42:49 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/nano
In-Reply-To: <20080307100735.DFD33120159@busybox.net>
References: <20080307100735.DFD33120159@busybox.net>
Message-ID: <f90898420803260642j671818c3p603a31b2ba185c3f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There seems to be a little typo in this patch...

nano should be installed to usr/bin/nano not to sbin/bin/nano.


2008/3/7, jacmet at uclibc.org <jacmet@uclibc.org>:
> Author: jacmet
>  Date: 2008-03-07 02:07:35 -0800 (Fri, 07 Mar 2008)
>  New Revision: 21266
>
>  Log:
>  nano: install to /usr/bin
>
>
>  Modified:
>    trunk/buildroot/package/editors/nano/nano.mk
>
>
>  Changeset:
>  Modified: trunk/buildroot/package/editors/nano/nano.mk
>  ===================================================================
>  --- trunk/buildroot/package/editors/nano/nano.mk        2008-03-07 10:02:12 UTC (rev 21265)
>  +++ trunk/buildroot/package/editors/nano/nano.mk        2008-03-07 10:07:35 UTC (rev 21266)
>  @@ -9,7 +9,7 @@
>   NANO_DIR:=$(BUILD_DIR)/nano-$(NANO_VERSION)
>   NANO_CAT:=$(ZCAT)
>   NANO_BINARY:=src/nano
>  -NANO_TARGET_BINARY:=bin/nano
>  +NANO_TARGET_BINARY:=sbin/bin/nano
>
>   $(DL_DIR)/$(NANO_SOURCE):
>         $(WGET) -P $(DL_DIR) $(NANO_SITE)/$(NANO_SOURCE)
>
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
