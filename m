From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Dec 2018 17:27:02 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: add binutils bug 20765 to
 linaro Aarch64be
In-Reply-To: <698923c53dba1a744211581ff830d2294965ff69.1543759351.git.yann.morin.1998@free.fr>
References: <cover.1543759351.git.yann.morin.1998@free.fr>
 <698923c53dba1a744211581ff830d2294965ff69.1543759351.git.yann.morin.1998@free.fr>
Message-ID: <20181202172702.29a7c6be@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Dec 2018 15:04:16 +0100, Yann E. MORIN wrote:

> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> index 9e7d2a6233..72d33140da 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> @@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20765

Any idea why the aarch64-be toolchain is affected, but not the aarch64
toolchain ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
