From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Oct 2015 20:41:18 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: Add option to build OSMesa
References: <56100EB3.2000300@dawncrow.de>
Message-ID: <ervvecx1cq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 03 Oct 2015 19:21:55 +0200 schrieb Andr? Hentschel:

> Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
> ---
>  package/mesa3d/Config.in | 7 +++++++
>  package/mesa3d/mesa3d.mk | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index a658986..fdeb599 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -117,6 +117,13 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>  
>  endif # BR2_PACKAGE_XORG7
>  
> +comment "Off-screen Rendering"
> +
> +config BR2_PACKAGE_MESA3D_OSMESA
> +	bool "OSMesa library"
> +	help
> +	  The OSMesa API provides functions for making off-screen renderings.
> +

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
