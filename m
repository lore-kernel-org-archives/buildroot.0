From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:30:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: bump to version
 20210328
In-Reply-To: <20210517063213.1513865-1-mgliga@bitdefender.com>
References: <20210517063213.1513865-1-mgliga@bitdefender.com>
Message-ID: <20210518123043.GG2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mircea, All,

On 2021-05-17 09:32 +0300, Mircea GLIGA spake thusly:
> Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbuffer/mbuffer.hash | 4 ++--
>  package/mbuffer/mbuffer.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
> index 73a8d3cf44..7c200d543e 100644
> --- a/package/mbuffer/mbuffer.hash
> +++ b/package/mbuffer/mbuffer.hash
> @@ -1,8 +1,8 @@
>  # From http://www.maier-komor.de/mbuffer.html
> -md5  e2b4f3b0d0944c08d52c167841bde3c0  mbuffer-20200929.tgz
> +md5  4e4712db5fbd4e71bfbfa2c145c6c646  mbuffer-20210328.tgz
>  
>  # Locally computed after checking signature upstream
> -sha256  53a6e3c14e9a049f18a09840653dd84f18e7ec7560f2dcf2b61c0ab5f0ead4e8  mbuffer-20200929.tgz
> +sha256  51b5b8d8488991a55fe1dfce90130f9e47bc1ce286ba03b4f628c04b784fdc5d  mbuffer-20210328.tgz
>  
>  # Hash for license file
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
> index 90a72ce657..c7c4456651 100644
> --- a/package/mbuffer/mbuffer.mk
> +++ b/package/mbuffer/mbuffer.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBUFFER_VERSION = 20200929
> +MBUFFER_VERSION = 20210328
>  MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
>  MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
>  MBUFFER_LICENSE = GPL-3.0+
> -- 
> 2.31.1
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
