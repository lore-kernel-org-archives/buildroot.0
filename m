From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:24:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 7.4.0
In-Reply-To: <20210518053008.1104981-1-zhaojh329@gmail.com>
References: <20210518053008.1104981-1-zhaojh329@gmail.com>
Message-ID: <20210518112420.GU2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jianhiu, All,

On 2021-05-18 13:30 +0800, Jianhui Zhao spake thusly:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtty/rtty.hash | 2 +-
>  package/rtty/rtty.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
> index 283a5d1da5..b2e9db2436 100644
> --- a/package/rtty/rtty.hash
> +++ b/package/rtty/rtty.hash
> @@ -1,2 +1,2 @@
> -sha256  4c60eacd7a653988a1907284de2ecf360c74f55ef9e21c40b9ebd87af6570908  rtty-7.3.2.tar.gz
> +sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802  rtty-7.4.0.tar.gz
>  sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
> diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
> index dc91445287..4ec220394c 100644
> --- a/package/rtty/rtty.mk
> +++ b/package/rtty/rtty.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTTY_VERSION = 7.3.2
> +RTTY_VERSION = 7.4.0
>  RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
>  RTTY_LICENSE = MIT
>  RTTY_LICENSE_FILES = LICENSE
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
