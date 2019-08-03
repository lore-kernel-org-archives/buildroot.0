From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 08:46:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/icu: Fix nios2 build
In-Reply-To: <20190803063135.24777-1-bernd.kuhls@t-online.de>
References: <20190803063135.24777-1-bernd.kuhls@t-online.de>
Message-ID: <20190803084652.1a4a4acf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for looking into these.

On Sat,  3 Aug 2019 08:31:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../icu/0006-ICU-20751-Fix-nios2-build.patch  | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/icu/0006-ICU-20751-Fix-nios2-build.patch
> 
> diff --git a/package/icu/0006-ICU-20751-Fix-nios2-build.patch b/package/icu/0006-ICU-20751-Fix-nios2-build.patch
> new file mode 100644
> index 0000000000..3b67df5bdb
> --- /dev/null
> +++ b/package/icu/0006-ICU-20751-Fix-nios2-build.patch
> @@ -0,0 +1,36 @@
> +From bfce346962841732f27f629c4f4661faa778f330 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 3 Aug 2019 08:05:35 +0200
> +Subject: [PATCH] ICU-20751 Fix nios2 build

What is ICU-20751 ? It's not clear if the patch comes from upstream or
not, since you are the author of patch.

Indeed, I see the nios2 and xtensa fixes are not the same, so I guess
they have a different double conversion behavior, but how did you
figure this out ?

If it's an upstream fix, could you share a link to it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
