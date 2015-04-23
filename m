From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Apr 2015 00:01:52 +0200
Subject: [Buildroot] [PATCH 11/30] package/matchbox: point to new home
In-Reply-To: <1b8a30a38d5f4cc09e60cf5ee62d17faf76d4876.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <1b8a30a38d5f4cc09e60cf5ee62d17faf76d4876.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396BD0.30900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> The new home of the matchbox project is with the Yocto
> project^Wumbrella^Wbuildsystem^Wdistribution^Wwhatever
> that is. ;-)

 I have no problem with this commit message :-)

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 2f9b73d..891ac95 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_MATCHBOX
>  	  handhelds, set-top boxes, kiosks and anything else for which
>  	  screen space, input mechanisms or system resources are limited.
>  
> -	  http://matchbox-project.org/
> +	  https://www.yoctoproject.org/tools-resources/projects/matchbox
>  
>  if BR2_PACKAGE_MATCHBOX
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
