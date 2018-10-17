From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 10:42:55 +0200
Subject: [Buildroot] [PATCH 2/3] perl: fix the generated subdirectory
 Makefiles
In-Reply-To: <20181016195505.30438-2-francois.perrad@gadz.org>
References: <20181016195505.30438-1-francois.perrad@gadz.org>
 <20181016195505.30438-2-francois.perrad@gadz.org>
Message-ID: <20181017104255.2caae9f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Tue, 16 Oct 2018 21:55:04 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...the-generated-subdirectory-Makefiles.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
> 
> diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
> new file mode 100644
> index 000000000..71560c5e0
> --- /dev/null
> +++ b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
> @@ -0,0 +1,30 @@
> +From 30ae4c9e2ac6cd27138ebf124cbda9232c56bdf7 Mon Sep 17 00:00:00 2001
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Tue, 16 Oct 2018 21:20:12 +0200
> +Subject: [PATCH] fix the generated subdirectory Makefiles
> +
> +all variables used by BR must be propagated
> +
> +similar to https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/commit/98e8532fffe5afa8186329acc44fb957427f1823
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Aaah, excellent! This is so much better than having to SED the
Makefiles.

Thanks a lot for having researched a better solution to this problem,
much appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
