From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 07:42:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuwsc: bump version to 3.3.5
In-Reply-To: <20200407051325.22489-1-zhaojh329@gmail.com>
References: <20200407051325.22489-1-zhaojh329@gmail.com>
Message-ID: <20200407054217.GX22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jianhui, All,

On 2020-04-07 13:13 +0800, Jianhui Zhao spake thusly:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libuwsc/libuwsc.hash | 2 +-
>  package/libuwsc/libuwsc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
> index e73d105cd1..4e226edfde 100644
> --- a/package/libuwsc/libuwsc.hash
> +++ b/package/libuwsc/libuwsc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 ef789ff35e537e5191ec0d13f3e0df54187a54eace611e283ad4172d4411d08b  libuwsc-3.3.4.tar.gz
> +sha256 a06b7324671e181ffe3165e93e6f94c7ac1380f69e32a52e80c8da7016acd60d  libuwsc-3.3.5.tar.gz
>  sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
> diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
> index c0c05e7223..83d05a96ec 100644
> --- a/package/libuwsc/libuwsc.mk
> +++ b/package/libuwsc/libuwsc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUWSC_VERSION = 3.3.4
> +LIBUWSC_VERSION = 3.3.5
>  LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
>  LIBUWSC_LICENSE = MIT
>  LIBUWSC_LICENSE_FILES = LICENSE
> -- 
> 2.17.1
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
