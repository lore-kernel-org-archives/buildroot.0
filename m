From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 29 Oct 2015 08:40:18 +0100
Subject: [Buildroot] [PATCH 2/2] luv: remove the default value of the
 $(PKG)_SOURCE variable
In-Reply-To: <1446021547-18360-2-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1446021547-18360-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1446021547-18360-2-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1446104418.1920.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2015-10-28 at 09:39 +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
> ?package/luv/luv.mk?????????????| 1 -
> ?1 file changed, 1 deletion(-)
> 
> diff --git a/package/luv/luv.mk b/package/luv/luv.mk
> index 8e108a0..723afdb 100644
> --- a/package/luv/luv.mk
> +++ b/package/luv/luv.mk
> @@ -5,7 +5,6 @@
> ?####################################################################
> ############
> ?
> ?LUV_VERSION = 1.7.4-4
> -LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
> ?LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERS
> ION)
> ?LUV_LICENSE = Apache-2.0
> ?LUV_LICENSE_FILES = LICENSE.txt

As?LUV_SOURCE defaults to luv-$(LUV_VERSION).tar.gz this entry 
is redundant.

Acked-by: J?rg Krause <joerg.krause@embedded.rocks>
