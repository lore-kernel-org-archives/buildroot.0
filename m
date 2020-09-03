From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:16:49 +0200
Subject: [Buildroot] [PATCH] package/libzip: add patch from upstream to
 fix build
In-Reply-To: <20200902201431.2197792-1-paul@crapouillou.net>
References: <20200902201431.2197792-1-paul@crapouillou.net>
Message-ID: <20200903221649.630985a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Sep 2020 22:14:30 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Cherry-pick a patch from upstream project that fixes the build.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Which build issue is this fixing ? What toolchain/C library ? Since
when is this happening ? Do we need to backport this fix to our stable
branches ? Do we have autobuilder failures for this ?

> diff --git a/package/libzip/0002-Include-limits.h-for-INT_MAX.patch b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
> new file mode 100644
> index 0000000000..e1d728158e
> --- /dev/null
> +++ b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
> @@ -0,0 +1,27 @@
> +From fd89e242d16128dedef08f47d99ae56aa19b0591 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?=C3=98rjan=20Malde?= <red@foxi.me>
> +Date: Wed, 15 Jul 2020 12:16:16 +0200
> +Subject: [PATCH] Include limits.h for INT_MAX
> +
> +[Retrieved from:
> +https://github.com/pcercuei/libzip/commit/fd89e242d16128dedef08f47d99ae56aa19b0591]

This URL gives me a 404.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
