From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 16:18:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 bump version
In-Reply-To: <20200614105651.2149674-1-bernd.kuhls@t-online.de>
References: <20200614105651.2149674-1-bernd.kuhls@t-online.de>
Message-ID: <20200614141819.GQ2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-14 12:56 +0200, Bernd Kuhls spake thusly:
> Reformatted hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash    | 4 ++--
>  .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk      | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> index ff816c7bbe..321ae5b606 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 b074366aad25cae38bb455792ac3110d52bcb0e4a183766c37ee12cbe56d7f8c  xdriver_xf86-video-intel-f66d39544bb8339130c96d282a80f87ca1606caf.tar.gz
> -sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
> +sha256  029afa61e785f6e0fb18d2c2f1619e97af8b6f19c7fa0ba9923eea03ccf78626  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc.tar.gz
> +sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index fb74eb6ad5..ac598cf0fb 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_INTEL_VERSION = f66d39544bb8339130c96d282a80f87ca1606caf
> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc
>  XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
