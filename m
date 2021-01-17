From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 16:56:23 +0100
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.0.5
In-Reply-To: <20210117151857.922586-1-francois.perrad@gadz.org>
References: <20210117151857.922586-1-francois.perrad@gadz.org>
Message-ID: <20210117155623.GO2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-01-17 16:18 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/htop/htop.hash | 2 +-
>  package/htop/htop.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/htop/htop.hash b/package/htop/htop.hash
> index 6a6534eee..647feabb8 100644
> --- a/package/htop/htop.hash
> +++ b/package/htop/htop.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3a403b4af4b5100a86183d3e9bb4839fcec99ac4368a60c242e9d7c742a34928  htop-3.0.4.tar.gz
> +sha256  19535f8f01ac08be2df880c93c9cedfc50fa92320d48e3ef92a30b6edc4d1917  htop-3.0.5.tar.gz
>  sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index 25d1a9a12..15a56485c 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HTOP_VERSION = 3.0.4
> +HTOP_VERSION = 3.0.5
>  HTOP_SITE = https://dl.bintray.com/htop/source
>  HTOP_DEPENDENCIES = ncurses
>  # Prevent htop build system from searching the host paths
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
