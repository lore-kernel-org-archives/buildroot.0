From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 09:12:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.54.2
In-Reply-To: <20200515211347.190758-1-james.hilliard1@gmail.com>
References: <20200515211347.190758-1-james.hilliard1@gmail.com>
Message-ID: <20200517071221.GS12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-15 15:13 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Since this is just a bug-fix release, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index 1fb902742d..b1d230938a 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.54.1/meson-0.54.1.tar.gz.asc
> -sha256  2f76fb4572762be13ee479292610091b4509af5788bcceb391fe222bcd0296dc  meson-0.54.1.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.54.2/meson-0.54.2.tar.gz.asc
> +sha256  a7716eeae8f8dff002e4147642589ab6496ff839e4376a5aed761f83c1fa0455  meson-0.54.2.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index fea2807d9f..d5b1e86811 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MESON_VERSION = 0.54.1
> +MESON_VERSION = 0.54.2
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
> -- 
> 2.25.1
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
