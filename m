From: Fathi Boudra <fboudra@gmail.com>
Date: Thu, 28 Feb 2008 16:25:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
In-Reply-To: <20080222193740.42EF412C75F@busybox.net>
References: <20080222193740.42EF412C75F@busybox.net>
Message-ID: <6a2e33620802280725s7cf380cdhc4cafbd074ca5ec3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/22/08, sjhill at uclibc.org <sjhill@uclibc.org> wrote:
> Author: sjhill
> Date: 2008-02-22 11:37:39 -0800 (Fri, 22 Feb 2008)
> New Revision: 21086
>
> Log:
> Update diff version.
>
>
> Modified:
> trunk/buildroot/target/x86/grub/grub.mk
>
>
> Changeset:
> Modified: trunk/buildroot/target/x86/grub/grub.mk
> ===================================================================
> --- trunk/buildroot/target/x86/grub/grub.mk	2008-02-21 04:35:14 UTC (rev
> 21085)
> +++ trunk/buildroot/target/x86/grub/grub.mk	2008-02-22 19:37:39 UTC (rev
> 21086)
> @@ -21,7 +21,7 @@
> #
> #############################################################
> GRUB_SOURCE:=grub_0.97.orig.tar.gz
> -GRUB_PATCH:=grub_0.97-28.diff.gz
> +GRUB_PATCH:=grub_0.97-31.diff.gz
> GRUB_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
> GRUB_PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
> GRUB_CAT:=$(ZCAT)
>

It resolves issue 2104 :
http://bugs.uclibc.org/view.php?id=2104

please update resolution in the bug tracker.

Thks.

cheers,

Fathi
