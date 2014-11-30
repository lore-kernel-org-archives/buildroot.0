From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Nov 2014 16:59:46 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
In-Reply-To: <547B2D0F.6080904@jcz.nl>
References: <1417358256-3782-1-git-send-email-jaap@jcz.nl>
 <20141130144053.GY2374@sapphire.tkos.co.il>
 <547B2D0F.6080904@jcz.nl>
Message-ID: <20141130145945.GZ2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jaap,

On Sun, Nov 30, 2014 at 03:43:27PM +0100, Jaap Crezee wrote:
> On 11/30/14 15:40, Baruch Siach wrote:
> > From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
> 
> Like this?

Yes. This is better. But please send the patch inline like you did with the 
previous one. When doing so please add '-v 2' to your 'git format-patch' or 
'git send-email' command to have 'v2' appended to the [PATCH] subject prefix.

Thanks,
baruch

> From 50a00f68bbd0bc18217c8e9883c4a20a598ea0b9 Mon Sep 17 00:00:00 2001
> From: Jaap Crezee <jaap@jcz.nl>
> Date: Sun, 30 Nov 2014 15:35:31 +0100
> Subject: [PATCH] bluez5_utils: bumped version number to 5.25
> 
> Signed-off-by: Jaap Crezee <jaap@jcz.nl>
> ---
>  package/bluez5_utils/bluez5_utils.hash | 2 ++
>  package/bluez5_utils/bluez5_utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/bluez5_utils/bluez5_utils.hash
> 
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> new file mode 100644
> index 0000000..c8295f9
> --- /dev/null
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -0,0 +1,2 @@
> +# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> +sha256  5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30    bluez-5.25.tar.xz
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index f34513c..21f792c 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BLUEZ5_UTILS_VERSION = 5.21
> +BLUEZ5_UTILS_VERSION = 5.25
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
