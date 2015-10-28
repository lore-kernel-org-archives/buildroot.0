From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Oct 2015 09:10:43 +0200
Subject: [Buildroot] [PATCH 1/1] luv: remove the default value of the
 $(PKG)_SOURCE variable
In-Reply-To: <1446015711-28080-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1446015711-28080-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20151028071043.GM2229@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

On Wed, Oct 28, 2015 at 08:01:51AM +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/luv/luv.mk             | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/luv/luv.mk b/package/luv/luv.mk
> index 8e108a0..723afdb 100644
> --- a/package/luv/luv.mk
> +++ b/package/luv/luv.mk
> @@ -5,7 +5,6 @@
>  ################################################################################
>  
>  LUV_VERSION = 1.7.4-4
> -LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
>  LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
>  LUV_LICENSE = Apache-2.0
>  LUV_LICENSE_FILE = LICENSE.txt

This patch conflicts with the license typo fix patch. In this case it's better 
to send both patches in a series. That makes patch dependencies easier to 
manage.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
