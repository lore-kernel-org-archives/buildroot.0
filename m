From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:28:46 +0100
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_490
In-Reply-To: <20201213171531.5182-1-gilles.talis@gmail.com>
References: <20201213171531.5182-1-gilles.talis@gmail.com>
Message-ID: <20201213212846.GK3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2020-12-13 18:15 +0100, Gilles Talis spake thusly:
> Also updated indentation in hash file (two spaces)
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Series of three applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/iozone/iozone.hash | 2 +-
>  package/iozone/iozone.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
> index f2f40473c3..61e8ff3abe 100644
> --- a/package/iozone/iozone.hash
> +++ b/package/iozone/iozone.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	6155850d1019f2450dc926bbdb5a24abf423ee3bb928ab1e68569cf60a908584	iozone3_489.tar
> +sha256  5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed  iozone3_490.tar
> diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
> index a491faf9d4..ebb6243651 100644
> --- a/package/iozone/iozone.mk
> +++ b/package/iozone/iozone.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IOZONE_VERSION = 3_489
> +IOZONE_VERSION = 3_490
>  IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
>  IOZONE_SITE = http://www.iozone.org/src/current
>  IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
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
