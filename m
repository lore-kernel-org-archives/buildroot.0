From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 7 Jan 2009 07:09:24 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090106214244.0870976CB5@busybox.osuosl.org>
References: <20090106214244.0870976CB5@busybox.osuosl.org>
Message-ID: <20090107070924.57955742@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Jan 2009 21:42:43 +0000 (UTC)
ulf at uclibc.org wrote:

<snipp>

> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
> ===================================================================
> --- trunk/buildroot/target/linux/Makefile.in.advanced
> 2009-01-06 21:24:42 UTC (rev 24711) +++
> trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-06
> 21:42:43 UTC (rev 24712) @@ -190,7 +190,8 @@
> INSTALL_MOD_PATH=$(TARGET_DIR) \ CROSS_COMPILE=$(KERNEL_CROSS) \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
> -	LZMA="$(LZMA)"
> +	LZMA="$(LZMA)" \
> +	PATH=$(STAGING_DIR)/usr/bin:$(PATH)
>  

PATH=$(TARGET_PATH) ?

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
