From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 22:58:36 +0100
Subject: [Buildroot] [PATCH] package/proj: update to 6.2.1
In-Reply-To: <20200101184611.17126-1-zgyarmati@zgyarmati.de>
References: <20200101184611.17126-1-zgyarmati@zgyarmati.de>
Message-ID: <20200101215836.GQ3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2020-01-01 19:46 +0100, Zoltan Gyarmati spake thusly:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/proj/proj.hash | 2 +-
>  package/proj/proj.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index c409544d77..d06de110a4 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
>  # Fetched from http://download.osgeo.org/proj/proj-6.2.0.tar.gz.md5
>  md5 5cde556545828beaffbe50b1bb038480 proj-6.2.0.tar.gz
>  # Locally calculated
> -sha256 b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50 proj-6.2.0.tar.gz
> +sha256 7f2e0fe63312f1e766057cceb53dc9585c4a335ff6641de45696dbd40d17c340 proj-6.2.1.tar.gz
>  sha256 2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6 COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index faa7dab19b..3a8ac6c787 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PROJ_VERSION = 6.2.0
> +PROJ_VERSION = 6.2.1
>  PROJ_SITE = http://download.osgeo.org/proj
>  PROJ_LICENSE = MIT
>  PROJ_LICENSE_FILES = COPYING
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
