From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Sep 2015 19:17:59 +0200
Subject: [Buildroot] [PATCHv2] mesa3d: bump version to 10.6.7
References: <1441978635-44174-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <XnsA512C453BC675berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente Olivert Riera <Vincent.Riera@imgtec.com> 
wrote in news:1441978635-44174-1-git-send-email-Vincent.Riera at imgtec.com:

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera-
1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
> Changes v1 -> v2:
>   - Also bump mesa3d-headers (Thomas Petazzoni)
> 
>  package/mesa3d-headers/mesa3d-headers.mk |    2 +-
>  package/mesa3d/mesa3d.hash               |    4 ++--
>  package/mesa3d/mesa3d.mk                 |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-
headers/mesa3d-headers.mk
> index 2eaa515..561fe57 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>  
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 10.6.6
> +MESA3D_HEADERS_VERSION = 10.6.7

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(runtime tested with Kodi Isengard)

Regards, Bernd
