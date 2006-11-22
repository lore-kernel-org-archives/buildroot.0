From: M. Edward (Ed) Borasky <znmeb@cesmail.net>
Date: Wed, 22 Nov 2006 13:12:30 -0800
Subject: [Buildroot] svn commit: trunk/buildroot/target/cpio
In-Reply-To: <20061122195836.43A3C485D7@busybox.net>
References: <20061122195836.43A3C485D7@busybox.net>
Message-ID: <4564BD3E.7070000@cesmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aldot at uclibc.org wrote:
> Author: aldot
> Date: 2006-11-22 11:58:35 -0800 (Wed, 22 Nov 2006)
> New Revision: 16633
>
> Log:
> - fix indentation
>
>
> Modified:
>    trunk/buildroot/target/cpio/cpioroot.mk
>
>
> Changeset:
> Modified: trunk/buildroot/target/cpio/cpioroot.mk
> ===================================================================
> --- trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 19:18:47 UTC (rev 16632)
> +++ trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 19:58:35 UTC (rev 16633)
> @@ -7,7 +7,7 @@
>  CPIO_TARGET:=$(IMAGE).cpio
>  
>  cpioroot-init:
> -       ln -s sbin/init $(TARGET_DIR)/init
> +	ln -s sbin/init $(TARGET_DIR)/init
>  
>  cpioroot: host-fakeroot makedevs cpioroot-init
>         - at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
It's more than just line 10 ... fix line 10 and it moves to line 13 :(

-- 
M. Edward (Ed) Borasky, FBG, AB, PTA, PGS, MS, MNLP, NST, ACMC(P)
http://borasky-research.blogspot.com/

If God had meant for carrots to be eaten cooked, He would have given rabbits fire.
