From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 15:10:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/project
In-Reply-To: <20070917124340.9C82530067@busybox.net>
References: <20070917124340.9C82530067@busybox.net>
Message-ID: <20070917131018.GB24993@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 05:43:40AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-17 05:43:40 -0700 (Mon, 17 Sep 2007)
>New Revision: 19870
>
>Log:
>Add debug info

Congratulations, you completely broke the build.

Get yourself a branch if you want to do stuff like that, please,
*please*.
>
>Modified:
>   trunk/buildroot/project/Makefile.in
>
>
>Changeset:
>Modified: trunk/buildroot/project/Makefile.in
>===================================================================
>--- trunk/buildroot/project/Makefile.in	2007-09-17 12:42:56 UTC (rev 19869)
>+++ trunk/buildroot/project/Makefile.in	2007-09-17 12:43:40 UTC (rev 19870)
>@@ -73,3 +73,11 @@
> VENDOR_PATCH_DIR:=$(strip $(subst ",,$(BR2_VENDOR_PATCH_DIR)))
> #"))
> 
>+vendor-dbg:
>+	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)
>+	@echo VENDOR_SUFFIX=$(BR2_VENDOR_SUFFIX)
>+	@echo VENDOR_BINUTILS_RELEASE=$(BR2_VENDOR_BINUTILS_RELEASE)
>+	@echo VENDOR_GCC_RELEASE=$(BR2_VENDOR_GCC_RELEASE)
>+	@echo VENDOR_UCLIBC_RELEASE=$(BR2_VENDOR_UCLIBC_RELEASE)
>+	@echo VENDOR_GDB_RELEASE=$(BR2_VENDOR_GDB_RELEASE)
>+	@echo VENDOR_PATCH_DIR=$(BR2_VENDOR_PATCH_DIR)
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
