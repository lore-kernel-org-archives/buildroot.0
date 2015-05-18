From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 May 2015 18:31:37 +0300
Subject: [Buildroot] [PATCH v2 1/2] libsodium: new package
In-Reply-To: <1431955144-31785-1-git-send-email-fhunleth@troodon-software.com>
References: <1431955144-31785-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150518153137.GM2845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

On Mon, May 18, 2015 at 09:19:03AM -0400, Frank Hunleth wrote:
> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> new file mode 100644
> index 0000000..f58c324
> --- /dev/null
> +++ b/package/libsodium/libsodium.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libsodium
> +#
> +################################################################################
> +
> +LIBSODIUM_VERSION = 1.0.3
> +LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
> +LIBSODIUM_LICENSE = ISC
> +LIBSODIUM_LICENSE_FILES = LICENSE
> +LIBSODIUM_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

The host package is still here. Please remove.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
