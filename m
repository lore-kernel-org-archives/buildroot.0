From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:14:52 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: bump to 1.28.0
In-Reply-To: <20180207145215.19465-1-aduskett@gmail.com>
References: <20180207145215.19465-1-aduskett@gmail.com>
Message-ID: <20180208231452.0c2691db@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Feb 2018 09:52:15 -0500, Adam Duskett wrote:

> diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> index 105626cbe2..4a9881a075 100644
> --- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> +++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> @@ -4,6 +4,8 @@ Date: Mon, 25 Nov 2013 22:51:53 +0100
>  Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[Adam Duskett: update for busybox 1.28.0]
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

Can I ask that you refrain from adding such lines when the patch is
simply refreshed? If you're doing some real changes in the patch to fix
some conflicts, then it's fine to add that. But you seem to be adding
these lines whenever a patch is preserved, even if it has just been
refreshed in terms of line offsets. To me, re-adding a comment + SoB in
such a situation is useless noise.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
