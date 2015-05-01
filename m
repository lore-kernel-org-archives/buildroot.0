From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:32:22 +0200
Subject: [Buildroot] [PATCH 21/30] package/matchbox: make it a menu
In-Reply-To: <533fd5f85aa1c8de1d693443c78be0902b87ed8d.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <533fd5f85aa1c8de1d693443c78be0902b87ed8d.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543E2D6.3050105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> We're about to add a few more options, so it now warrants a menu for
> itself.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I would move this earlier in the series (around the time you move everything
one directory up), but that's not so important.

 Regards,
 Arnout

> ---
>  package/matchbox/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 39eb616..9d8d060 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_MATCHBOX
> +menuconfig BR2_PACKAGE_MATCHBOX
>  	bool "matchbox"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU # fork()
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
