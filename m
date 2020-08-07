From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 13:58:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/htop: add patch for fixing
 build with gcc 10
In-Reply-To: <20200807102223.1595194-1-fido_max@inbox.ru>
References: <20200807102223.1595194-1-fido_max@inbox.ru>
Message-ID: <20200807135812.5063df1f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  7 Aug 2020 13:22:23 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

No, you can't add my Reviewed-by like this, I have never given my
Reviewed-by. You can add such tags from others if they have explicitly
been given by those other contributors.

> diff --git a/package/htop/gcc-10.patch b/package/htop/gcc-10.patch
> new file mode 100644
> index 0000000000..1e2ecebb29
> --- /dev/null
> +++ b/package/htop/gcc-10.patch

It seems like you generated the patch with git format-patch, so please
use the patch naming from git format-patch, which looks like
0001-<title-of-the-commit>.patch.

> @@ -0,0 +1,170 @@
> +From dfd9279f87791e36a5212726781c31fbe7110361 Mon Sep 17 00:00:00 2001
> +From: Nathan Scott <nathans@redhat.com>
> +Date: Fri, 10 Jul 2020 10:35:32 +1000
> +Subject: [PATCH] Resolve complation issues with -fno-common (default from
> + gcc-10)
> +
> +Extends the MakeHeader script to auto-generate correct "extern"
> +function declarations in some cases that it currently does not.
> +
> +Related to https://github.com/hishamhm/htop/pull/981

We need your Signed-off-by line here + a reference to where this comes
from. See
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
