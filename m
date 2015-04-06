From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 15:16:11 +0200
Subject: [Buildroot] [PATCH] Makefile: add help for
 linux-update-defconfig target
In-Reply-To: <1428003286-13449-1-git-send-email-yegorslists@googlemail.com>
References: <1428003286-13449-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <5522871B.2050603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/15 21:34, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index edb122b..08b5c1e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -878,6 +878,8 @@ endif
>  ifeq ($(BR2_LINUX_KERNEL),y)
>  	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
>  	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
> +	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
> +	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
>  endif
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
