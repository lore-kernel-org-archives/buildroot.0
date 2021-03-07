From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 22:18:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to
 3.10.1
In-Reply-To: <20210307141933.3187167-1-zhaojh329@gmail.com>
References: <20210307141933.3187167-1-zhaojh329@gmail.com>
Message-ID: <20210307211822.GF2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jianhui, All,

On 2021-03-07 22:19 +0800, Jianhui Zhao spake thusly:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libuhttpd/libuhttpd.hash | 2 +-
>  package/libuhttpd/libuhttpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
> index e772cc84ee..4b0b5027c6 100644
> --- a/package/libuhttpd/libuhttpd.hash
> +++ b/package/libuhttpd/libuhttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  78b1c670e4f259346a1e49e57d158c619eace23f0b72821b0ff2ba991f7dcc51  libuhttpd-3.10.0.tar.gz
> +sha256  6e7a9ad61e3d0ab5bd4d20b274b850542dff8057a8fcf6c36ce59eb34818f61f  libuhttpd-3.10.1.tar.gz
>  sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
> diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
> index 06d7bc7d5e..326c78face 100644
> --- a/package/libuhttpd/libuhttpd.mk
> +++ b/package/libuhttpd/libuhttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUHTTPD_VERSION = 3.10.0
> +LIBUHTTPD_VERSION = 3.10.1
>  LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
>  LIBUHTTPD_LICENSE = MIT
>  LIBUHTTPD_LICENSE_FILES = LICENSE
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
