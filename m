From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 21:56:50 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180828215650.7a620434@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 19:01:53 +0200, Giulio Benetti wrote:

> diff --git a/package/mender/0001-ioctl-allow-building-for-ppc64le.patch b/package/mender/0001-ioctl-allow-building-for-ppc64le.patch
> new file mode 100644
> index 0000000000..f8aeaae143
> --- /dev/null
> +++ b/package/mender/0001-ioctl-allow-building-for-ppc64le.patch
> @@ -0,0 +1,31 @@
> +From 0c15fedbfe962912c8ad5e16073f4fc5ad03797f Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Tue, 28 Aug 2018 18:48:22 +0200
> +Subject: [PATCH] ioctl: allow building for ppc64le

So you allow building for ppc64le...

> +ppc64le is not supported at the moment.

... but ppc64le is not supported ?

This commit message doesn't make much sense I'm afraid :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
