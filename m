From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:11:34 +0200
Subject: [Buildroot] [PATCH] imx-vpu: bump to version 5.4.38
In-Reply-To: <8767305f-2849-6fc9-49e0-422fa43e82eb@gmail.com>
References: <8767305f-2849-6fc9-49e0-422fa43e82eb@gmail.com>
Message-ID: <20180831231134.1429323d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dan,

On Fri, 31 Aug 2018 13:44:08 -0400, Dan Riegsecker wrote:
> This patch is based on what was released by NXP with image version
> 4.9.88-2.0.0.
> 
> This patch also corresponds with the Yocto equivalent:
> https://github.com/Freescale/meta-freescale/commit/1594c64

Thanks for this contribution, but we are already using imx-vpu 5.4.38.
Perhaps you missed it because this update is only in our "next" branch,
which will be merged back into the master branch after Buildroot
2018.08 is released.

See
https://git.buildroot.org/buildroot/commit/package/freescale-imx/imx-vpu?h=next&id=ea9efdf5675df29e6b4b7e48616a4f5da922c22f

> diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash 
> b/package/freescale-imx/imx-vpu/imx-vpu.hash
> index 0ac0f3d0c2..34abdc099c 100644
> --- a/package/freescale-imx/imx-vpu/imx-vpu.hash
> +++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
> @@ -1,2 +1,2 @@
>  ?# Locally computed
> -sha256 ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0 
> imx-vpu-5.4.37.bin
> +sha256 34bed0ddf6c797f444bddfa5d5495adc751ff268b6431d8beb48129c89c9e47f 
> imx-vpu-5.4.38.bin

Your patch anyway couldn't be applied: it is line-wrapped. You should
use "git send-email" to send your patches, and not Thunderbird.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
