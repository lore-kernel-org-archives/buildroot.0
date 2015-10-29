From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 29 Oct 2015 08:34:38 +0100
Subject: [Buildroot] [PATCH 1/2] luv: fix license typo
In-Reply-To: <1446021547-18360-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1446021547-18360-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1446104078.1920.0.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2015-10-28 at 09:39 +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
> ?package/luv/luv.mk | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/luv/luv.mk b/package/luv/luv.mk
> index 8e108a0..fd5c365 100644
> --- a/package/luv/luv.mk
> +++ b/package/luv/luv.mk
> @@ -8,7 +8,7 @@ LUV_VERSION = 1.7.4-4
> ?LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
> ?LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERS
> ION)
> ?LUV_LICENSE = Apache-2.0
> -LUV_LICENSE_FILE = LICENSE.txt
> +LUV_LICENSE_FILES = LICENSE.txt
> ?LUV_DEPENDENCIES = libuv
> ?LUV_INSTALL_STAGING = YES
> ?

Acked-by: J?rg Krause <joerg.krause@embedded.rocks>
