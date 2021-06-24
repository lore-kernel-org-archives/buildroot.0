From: Alexander Dahl <post@lespocky.de>
Date: Thu, 24 Jun 2021 13:50:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump version to 1.28.6
In-Reply-To: <20210624091248.7318-1-mf@go-sys.de>
References: <20210624091248.7318-1-mf@go-sys.de>
Message-ID: <20210624115005.fjsasggqdtl5knju@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Thu, Jun 24, 2021 at 11:12:48AM +0200, Michael Fischer wrote:
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/libqmi/libqmi.hash | 2 +-
>  package/libqmi/libqmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index 2720a8236d..0bfc63f4a4 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  3b14cd2ab5221a7adbb39fed16ef697538ea1c79308821ad2d19b505e1daaea0  libqmi-1.28.4.tar.xz
> +sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 278c0116be..35a41e5bd0 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBQMI_VERSION = 1.28.4
> +LIBQMI_VERSION = 1.28.6
>  LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
>  LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)

Reviewed-by: Alexander Dahl <post@lespocky.de>

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210624/529cffed/attachment.asc>
