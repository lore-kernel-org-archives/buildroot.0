From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:16:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/libseccomp: fix musl build
In-Reply-To: <1454176919-12144-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454176919-12144-1-git-send-email-bernd.kuhls@t-online.de>
 <1454176919-12144-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160201141631.53d89e66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 19:01:59 +0100, Bernd Kuhls wrote:

> diff --git a/package/libseccomp/0002-musl.patch b/package/libseccomp/0002-musl.patch
> new file mode 100644
> index 0000000..c3affba
> --- /dev/null
> +++ b/package/libseccomp/0002-musl.patch
> @@ -0,0 +1,33 @@
> +Fix musl build
> +
> +Downloaded from upstream PR:
> +https://github.com/seccomp/libseccomp/pull/23
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This should go ...

> +
> +
> +From eb5382287cd25235e760b5da4939510b11bbf2a1 Mon Sep 17 00:00:00 2001
> +From: Kylie McClain <somasis@exherbo.org>
> +Date: Fri, 1 Jan 2016 13:12:59 -0500
> +Subject: [PATCH] system.h: Remove conflicting kernel header include
> +
> +This fixes building on musl libc, since musl does not include kernel
> +headers. I've tested this as working on both glibc and musl.
> +
> +Signed-off-by: Kylie McClain <somasis@exherbo.org>

... here

I've fixed this and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
