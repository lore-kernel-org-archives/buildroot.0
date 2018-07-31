From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:47:23 +0200
Subject: [Buildroot] [PATCH v2 2/3] host-attr: build fix for GCC <4.5
In-Reply-To: <20180730220218.26454-2-hollis_blanchard@mentor.com>
References: <20180730220218.26454-1-hollis_blanchard@mentor.com>
 <20180730220218.26454-2-hollis_blanchard@mentor.com>
Message-ID: <20180731214723.3071cfca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jul 2018 15:02:17 -0700, Hollis Blanchard wrote:
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

An empty commit log is not very good. Also, in the commit title, use
just "attr" and not "host-attr" as the prefix.

> diff --git a/package/attr/0001-build-with-older-GCCs.patch b/package/attr/0001-build-with-older-GCCs.patch
> new file mode 100644
> index 0000000000..2aa41107f9
> --- /dev/null
> +++ b/package/attr/0001-build-with-older-GCCs.patch
> @@ -0,0 +1,87 @@
> +From 3ac428794ea0f95c854166c9c0cffb0267c5e98b Mon Sep 17 00:00:00 2001
> +From: Hollis Blanchard <hollis_blanchard@mentor.com>
> +Date: Mon, 30 Jul 2018 14:17:21 -0700
> +Subject: [PATCH] build with older GCCs

This is not a good title for a patch. We want the title to say what
the patch does instead.

> +
> +GCC versions up through 4.4.7 (which is used in RHEL 6) do not accept any
> +argument for the deprecated attribute. GCC 4.5 and later say the "msg"
> +argument is optional. We don't need the messages during Buildroot builds
> +anyways.
> +
> +Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

I fixed up those minor issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
