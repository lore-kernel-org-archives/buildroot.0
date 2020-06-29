From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:08:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.38
In-Reply-To: <20200629055827.196775-1-joerg.krause@embedded.rocks>
References: <20200629055827.196775-1-joerg.krause@embedded.rocks>
Message-ID: <20200629200853.GO20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2020-06-29 07:58 +0200, J?rg Krause spake thusly:
> Also fix formatting of hash file using two spaces as separator.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ncmpc/ncmpc.hash | 4 ++--
>  package/ncmpc/ncmpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
> index 963c6d2601..f31c15bd9e 100644
> --- a/package/ncmpc/ncmpc.hash
> +++ b/package/ncmpc/ncmpc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256 7c8eb727f6e12d8f97a53915b1b5632898b4afb335a1121c5e01c81df695615c  ncmpc-0.37.tar.xz
> +sha256  2bc1aa38aacd23131895cd9aa3abd9d1ca5700857034d9f35209e13e061e27a2  ncmpc-0.38.tar.xz
>  
>  # Hash for license file:
> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
> index 29675f2256..d4dfceae36 100644
> --- a/package/ncmpc/ncmpc.mk
> +++ b/package/ncmpc/ncmpc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NCMPC_VERSION_MAJOR = 0
> -NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).37
> +NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).38
>  NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
>  NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
>  NCMPC_DEPENDENCIES = \
> -- 
> 2.27.0
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
