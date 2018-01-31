From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Jan 2018 17:10:33 +0200
Subject: [Buildroot] [PATCH] Updated Liberation fonts source site
In-Reply-To: <CALoEJ8yDeSfTKw1=GYr_vCUGn7h7fD8VgxD6vjKZLJyk-sy=WA@mail.gmail.com>
References: <CALoEJ8yDeSfTKw1=GYr_vCUGn7h7fD8VgxD6vjKZLJyk-sy=WA@mail.gmail.com>
Message-ID: <20180131151033.dwdja6i3heisr6ef@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Biser,

On Wed, Jan 31, 2018 at 05:02:30PM +0200, Biser Milanov wrote:
> From 26efe7cec55ff310445ee7778e30de6d21e38d3e Mon Sep 17 00:00:00 2001
> From: Biser Milanov
> Date: Wed, 31 Jan 2018 16:51:22 +0200
> Subject: [PATCH] Updated Liberation fonts source site
> To: buildroot at busybox.org
> 
> Old location no longer reachable via wget even with
> "--no-check-certificate":
>     ERROR 404: Not Found.
> 
> Replaced old site with Wikipedia-cited official site pagure.org.
> ---
>  package/liberation/liberation.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/liberation/liberation.mk b/package/liberation/
> liberation.mk
> index dfed086..a77c014 100644
> --- a/package/liberation/liberation.mk
> +++ b/package/liberation/liberation.mk
> @@ -5,7 +5,7 @@
> ################################################################################
> 
> LIBERATION_VERSION = 2.00.1
> -LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
> +LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
> LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
> LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
> LIBERATION_LICENSE = OFLv1.1

This change is in the Buildroot master branch since last March:

  https://git.busybox.net/buildroot/commit/?id=53c07aa3a24d0f0a647e0e6858af5e65c6e81833

Peter, I guess we need this in the 2017.02.x branch as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
