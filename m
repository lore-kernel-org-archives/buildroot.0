From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:26:35 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/kodi-screensaver-rsxs: new
 package
In-Reply-To: <1445170286-12871-2-git-send-email-bernd.kuhls@t-online.de>
References: <1445170286-12871-1-git-send-email-bernd.kuhls@t-online.de>
 <1445170286-12871-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018232635.554b8862@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 18 Oct 2015 14:11:26 +0200, Bernd Kuhls wrote:

> ++get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
> ++string( REGEX REPLACE "-[^-]+$" ""
> ++        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
> ++

Same as for the goom one: can you submit this upstream?

> diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> new file mode 100644
> index 0000000..2df7683
> --- /dev/null
> +++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# kodi-screensaver-rsxs
> +#
> +################################################################################
> +
> +KODI_SCREENSAVER_RSXS_VERSION = 195e0ec3fbbcb2ee2012cd560e42d05167f0f259
> +KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))

Can you add the licensing information? I know there is none in the
upstream package, but this is not normal. Can you ask upstream to add
licensing details ?

Also, for github packages, we now what to have a hash file. Can you add
one (for both this one and goom) ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
