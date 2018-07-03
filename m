From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Jul 2018 23:39:53 +0200
Subject: [Buildroot] [PATCH v3 15/22]
 package/x11r7/xdriver_xf86-video-intel: bump version
In-Reply-To: <20180630110853.29339-16-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-16-bernd.kuhls@t-online.de>
Message-ID: <20180703213953.GF2530@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-06-30 13:08 +0200, Bernd Kuhls spake thusly:
> This version bump includes
> 
> https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=359477215092ac1b602ad1e2f17a28963d9224c2
> 
> which is needed for compatibility with upcoming xserver_xorg-server
> 1.20.0.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Too bad the intel driver has not tagged any release in almost 4 years
now... :-/

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash      | 2 +-
>  .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> index 1852540cb3..469649ec30 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 e3a107fadcdeef35830a12a305b09dfa793a33a54930a0ecd5e84a6156f546eb  xdriver_xf86-video-intel-84eaaba2737b2765f3fe843a138002ad0056a52b.tar.gz
> +sha256 8a008db80964700c57db407fe9fab78884d6919bd5343a269f681625132b4687  xdriver_xf86-video-intel-3d395062ce73f85e8340218df01c2ebf4bc25023.tar.gz
>  sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index 31cdf4b065..66b0f9defe 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_INTEL_VERSION = 84eaaba2737b2765f3fe843a138002ad0056a52b
> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 3d395062ce73f85e8340218df01c2ebf4bc25023
>  XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
