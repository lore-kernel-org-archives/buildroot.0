From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jun 2016 20:58:48 +0300
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
	1.6.9
In-Reply-To: <1465926673-13472-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465926673-13472-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160614175848.GL2749@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Jun 14, 2016 at 07:51:13PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/freeswitch.hash | 2 +-
>  package/freeswitch/freeswitch.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
> index 36bd75e..2fca1d4 100644
> --- a/package/freeswitch/freeswitch.hash
> +++ b/package/freeswitch/freeswitch.hash
> @@ -1,2 +1,2 @@
>  # From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.8.tar.xz.sha256

Please update the comment.

baruch

> -sha256	a9834667c0afc164631611b4862acd6411e4e6ddb706e4af4b51eab4adbe4fc1	freeswitch-1.6.8.tar.xz
> +sha256	aa5f191113be2bd44cb4f2108da3dcc37be3234c6b733896fbff97526ac66451	freeswitch-1.6.9.tar.xz
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index f4a3cc3..65e5266 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREESWITCH_VERSION = 1.6.8
> +FREESWITCH_VERSION = 1.6.9
>  FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
>  FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
>  FREESWITCH_LICENSE = MPLv1.1, \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
