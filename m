From: Julien Letessier <julien.letessier@technosens.fr>
Date: Fri, 13 Jul 2007 15:43:55 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20070713122120.4ADB1A6833@busybox.net>
References: <20070713122120.4ADB1A6833@busybox.net>
Message-ID: <f0528b5b0707130643r29a39ec9u7a9d087829fc465f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't want to start the eternal vi-vs-emacs flame war here...

But is it really wise to complexify Buildroot just because one
specific text editor is broken?

My .02 euros.

2007/7/13, aldot at uclibc.org <aldot@uclibc.org>:
> Author: aldot
> Date: 2007-07-13 05:21:19 -0700 (Fri, 13 Jul 2007)
> New Revision: 19081
>
> Log:
> - use established style
>
>
> Modified:
>    trunk/buildroot/Makefile
>
>
> Changeset:
> Modified: trunk/buildroot/Makefile
> ===================================================================
> --- trunk/buildroot/Makefile    2007-07-13 05:03:46 UTC (rev 19080)
> +++ trunk/buildroot/Makefile    2007-07-13 12:21:19 UTC (rev 19081)
> @@ -156,9 +156,12 @@
>  TARGETS:=uclibc
>  endif
>
> -PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))  # "))
> -TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME))) # " ))
> -BANNER:=$(strip $(subst ",,$(BR2_BANNER))) # " ))
> +PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
> +#"))
> +TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
> +#"))
> +BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
> +#"))
>
>
>  include toolchain/Makefile.in
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-- 
Julien Letessier
<julien.letessier@technosens.fr>
