From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 17:55:43 +0100
Subject: [Buildroot] [PATCH 1/3] package/refpolicy: Add patches pending
 the next release
In-Reply-To: <20210107135307.1762186-2-maxime.chevallier@bootlin.com>
References: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
 <20210107135307.1762186-2-maxime.chevallier@bootlin.com>
Message-ID: <20210107175543.2fb51ec6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jan 2021 14:53:05 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> diff --git a/package/refpolicy/0001-pending-next-release.patch b/package/refpolicy/0001-pending-next-release.patch
> new file mode 100644
> index 0000000000..e049845638
> --- /dev/null
> +++ b/package/refpolicy/0001-pending-next-release.patch
> @@ -0,0 +1,673 @@
> +From 2566e2dac2c759392e0b9f3d442b8489b726cb10 Mon Sep 17 00:00:00 2001
> +From: Antoine Tenart <antoine.tenart@bootlin.com>
> +Date: Mon, 31 Aug 2020 15:38:13 +0200
> +Subject: [PATCH 1/8] [pending next release]

Could you generate patches for packages with git format-patch -N to
avoid the numbering PATCH X/Y ? This is normally caught by "make
check-package".

Also, this particular patch is apparently a huge aggregation of several
individual upstream commits. We do want to have each individual commit
as a separate patch in Buildroot, with a reference to the upstream
commit, a bit like this:

Signed-off-by: Antoine T?nart ...
Upstream: link to upstream commit, or at least commit hash
Signed-off-by: You

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
