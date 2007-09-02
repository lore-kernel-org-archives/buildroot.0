From: Rouslan Solomakhin <rouslan@solomakhin.net>
Date: Sun, 2 Sep 2007 13:15:50 -0500 (CDT)
Subject: [Buildroot] Patch for gcc makefile
In-Reply-To: <45513.24.207.255.59.1188756845.squirrel@box240.bluehost.com>
References: <45513.24.207.255.59.1188756845.squirrel@box240.bluehost.com>
Message-ID: <53265.24.207.255.59.1188756950.squirrel@box240.bluehost.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Index: toolchain/gcc/gcc-uclibc-4.x.mk
> ===================================================================
> --- toolchain/gcc/gcc-uclibc-4.x.mk     (revision 19763)
> +++ toolchain/gcc/gcc-uclibc-4.x.mk     (working copy)
> @@ -293,7 +293,7 @@
>                 $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gccbug
>         # Strip the host binaries
>  ifeq ($(GCC_STRIP_HOST_BINARIES),true)
> -       strip --strip-all -R .note -R .comment $(filter-out
> -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
> +       strip --strip-all -R .note -R .comment $(filter-out
> gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
>         -strip --strip-all -R .note -R .comment
> $(STAGING_DIR)/usr/bin/faked
>  endif
>         # Make sure we have 'cc'.

Sorry for newlines after "filter-out". It's my mailer.

Rouslan
