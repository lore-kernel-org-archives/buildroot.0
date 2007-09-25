From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 18:16:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
In-Reply-To: <20070925144527.1DC94A4D18@busybox.net>
References: <20070925144527.1DC94A4D18@busybox.net>
Message-ID: <1190737019.19731.80.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-25 klockan 07:45 -0700 skrev jacmet at uclibc.org:
> Author: jacmet
> Date: 2007-09-25 07:45:26 -0700 (Tue, 25 Sep 2007)
> New Revision: 20021
> 
> Log:
> Don't limit 2006 version to Atmel targets (why?)
> 

Just tried to be non-intrusive...
The "normal" version is buggy, and this works for me,
but I have no targets for other architectures.

It may make sense to make it the default,
but someone else needs to test that.

BR
Ulf Samuelsson

> Modified:
>    trunk/buildroot/package/mtd/Config.in
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/mtd/Config.in
> ===================================================================
> --- trunk/buildroot/package/mtd/Config.in	2007-09-25 14:13:21 UTC (rev 20020)
> +++ trunk/buildroot/package/mtd/Config.in	2007-09-25 14:45:26 UTC (rev 20021)
> @@ -8,7 +8,6 @@
>  config BR2_PACKAGE_MTD_EXPERIMENTAL
>  	bool "Use experimental MTD (20061007)"
>  	depends on BR2_PACKAGE_MTD
> -	depends on BR2_TARGET_ATMEL
>  	default n
>  	help
>  	  Build mtd/jffs utilities with Dataflash support
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
