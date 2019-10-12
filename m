From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 21:46:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/memcached: bump to version
 1.5.19
In-Reply-To: <20191012162322.23290-1-bernd.kuhls@t-online.de>
References: <20191012162322.23290-1-bernd.kuhls@t-online.de>
Message-ID: <20191012214639.24ffb748@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 18:23:22 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> From: Christopher McCrory <chrismcc@gmail.com>
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> [Bernd: bump version 1.5.19, added patch to fix cross build]
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Fix-cross-compilation-errors.patch   | 213 ++++++++++++++++++

Please have one file per patch, do not concatenate them in a single
file.

> diff --git a/package/memcached/0001-Fix-cross-compilation-errors.patch b/package/memcached/0001-Fix-cross-compilation-errors.patch
> new file mode 100644
> index 0000000000..26cffc4503
> --- /dev/null
> +++ b/package/memcached/0001-Fix-cross-compilation-errors.patch
> @@ -0,0 +1,213 @@
> +From 9be6c201920365883bae389c10cbfdb7a73442e4 Mon Sep 17 00:00:00 2001
> +From: Ola Jeppsson <ola.jeppsson@gmail.com>
> +Date: Mon, 7 Oct 2019 18:07:30 -0400
> +Subject: [PATCH] configure: Fix cross-compilation errors

You have one patch here.


> +From 5c71149bb77c6d4b70e1363f2918a55798ca6b4e Mon Sep 17 00:00:00 2001
> +From: Ola Jeppsson <ola.jeppsson@gmail.com>
> +Date: Mon, 7 Oct 2019 19:57:46 -0400
> +Subject: [PATCH] configure: Simplify pointer size check
> +
> +Tested with:
> +Autoconf 2.59 / Automake 1.7.9
> +Autoconf 2.69 / Automake 1.16.1
> +
> +Downloaded from upstream PR:
> +https://github.com/memcached/memcached/pull/552
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

And another one here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
