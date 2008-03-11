From: Sunil Gupta <sg@monsoon.com>
Date: Tue, 11 Mar 2008 09:30:58 -0400 (EDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
In-Reply-To: <20080311131116.CF77A120135@busybox.net>
References: <20080311131116.CF77A120135@busybox.net>
Message-ID: <47870.69.65.92.49.1205242258.squirrel@webmail.learningsoft.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changing the fakeroot version number is not sufficient to correct the
defect in this case. As noted in the bug report:

    The closest matching version is 1.9.3. However, the patch file
    "fakeroot-revert-ltmain.patch" fails to apply against that
    version.

-- sg

> Author: ninevoltz
> Date: 2008-03-11 06:11:14 -0700 (Tue, 11 Mar 2008)
> New Revision: 21289
>
> Log:
> updated fakeroot version
>
> Modified:
>    trunk/buildroot/package/fakeroot/fakeroot.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
> ===================================================================
> --- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-11 10:25:42 UTC
> (rev 21288)
> +++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-11 13:11:14 UTC
> (rev 21289)
> @@ -3,7 +3,7 @@
>  # fakeroot
>  #
>  #############################################################
> -FAKEROOT_VERSION:=1.9
> +FAKEROOT_VERSION:=1.9.3
>  FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
>  FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
>  FAKEROOT_CAT:=$(ZCAT)
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
