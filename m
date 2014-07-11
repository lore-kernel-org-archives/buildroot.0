From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jul 2014 08:14:25 +0200
Subject: [Buildroot] [PATCH 01/14] freescale-imx: bump to version
	3.10.17-1.0.0
In-Reply-To: <7139dda2c668a5cae3ee54d8319a99529c7deec9.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
 <7139dda2c668a5cae3ee54d8319a99529c7deec9.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <53BF80C1.8080605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/06/14 23:52, Yann E. MORIN wrote:
> From: Gary Bisson <bisson.gary@gmail.com>
> 
> Bumping the version requires some heavy changes in the different
> i.MX related packages. Instead of having a single huge patch, those
> changes are split in smaller patches, one per affected package.
> 
> This has the inconvenient side-effect of breaking the build right
> now with the bump; but it is better since the patches are easier to
> understand.

 Of course, in the end all of these should be squashed into a single bisectable
commit.

 So I think this first patch (which is the one that will be kept when you do a
fixup) should have the complete commit message, and below the --- it should
mention which patches should be squashed into it.

 The commit messages of the subsequent packages are less important since they'll
be squashed away.

 Regards,
 Arnout

> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [yann.morin.1998 at free.fr: expand commit log]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> ---
>  package/freescale-imx/freescale-imx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index 39ffa8a..843ba61 100644
> --- a/package/freescale-imx/freescale-imx.mk
> +++ b/package/freescale-imx/freescale-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREESCALE_IMX_VERSION = 3.5.7-1.0.0
> +FREESCALE_IMX_VERSION = 3.10.17-1.0.0
>  FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
>  
>  include $(sort $(wildcard package/freescale-imx/*/*.mk))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
