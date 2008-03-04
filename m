From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 4 Mar 2008 13:30:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
References: <20080304121919.3D76F12C85D@busybox.net>
Message-ID: <01f801c87df4$8cd76e00$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Log:
> buildroot: add kernel-headers to base targets so it gets handled by external-deps
> 
> 
> 


Did you test this using an external toolchain
so you do not get any problems with buildroot overwriting toolchain etc.

Best Regards
Ulf Samuelsson

> Modified:
>   trunk/buildroot/Makefile
> 
> 
> Changeset:
> Modified: trunk/buildroot/Makefile
> ===================================================================
> --- trunk/buildroot/Makefile 2008-03-04 12:19:16 UTC (rev 21162)
> +++ trunk/buildroot/Makefile 2008-03-04 12:19:19 UTC (rev 21163)
> @@ -187,7 +187,7 @@
> #
> ##############################################################
> ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
> -BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils
> +BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
> else
> BASE_TARGETS:=uclibc
> endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
