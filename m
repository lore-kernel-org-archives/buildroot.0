From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 6 Jun 2019 14:40:55 +0800
Subject: [Buildroot] [PATCH] arch/nds32: force syntax colouring to
 kconfig.
In-Reply-To: <20190603191951.22360-1-yann.morin.1998@free.fr>
References: <20190603191951.22360-1-yann.morin.1998@free.fr>
Message-ID: <20190606064055.GA20024@app09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 04, 2019 at 03:19:51AM +0800, Yann E. MORIN wrote:
> It is too sad when an editor picks up the wrong syntax...
> 
> Like was done in e837837791 for all the other archs, force
> syntax to kconfig for nds32 too.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Nylon Chen <nylon7@andestech.com>
> ---
>  arch/Config.in.nds32 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
> index f268883662..322ff49f2e 100644
> --- a/arch/Config.in.nds32
> +++ b/arch/Config.in.nds32
> @@ -9,3 +9,6 @@ config BR2_ENDIAN
>  
>  config BR2_READELF_ARCH_NAME
>  	default "Andes Technology compact code size embedded RISC processor family"
> +
> +# vim: ft=kconfig
> +# -*- mode:kconfig; -*-
> -- 
> 2.20.1
>
Reviewed-by:Nylon Chen <nylon7@andestech.com> 
