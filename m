From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 18 Nov 2015 00:32:11 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: Your message of Wed, 11 Nov 2015 14:24:17 +0100.
 <20151111142417.76bf1bb7@free-electrons.com>
Message-ID: <201511171532.tAHFWBW9022529@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

I have sent patch for this just now.
Please apply.

Regards,
Kawashima

Thomas Petazzoni writes:
...
> > 2015-11-10 00:00:05	arm		./include/private/../gc_pthread_redirec
> ts.h:37:22: fatal error: dlfcn.h: No such file or directory
> 
> Two options here:
> 
>  (1) boehm gc in gauche supports the GC_NO_DLOPEN like the official
>      boehm gc. In this case, pass -DGC_NO_DLOPEN when
>      BR2_STATIC_LIBS=y. See bdwgc.mk for an example.
> 
>  (2) Make gauche depend on !BR2_STATIC_LIBS.
============================================================
    Hiroshi Kawashima
