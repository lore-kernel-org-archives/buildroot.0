From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:26:20 +0100
Subject: [Buildroot] [PATCH] package/proj: bump to 7.2.0
In-Reply-To: <20201213175918.3143775-1-zgyarmati@zgyarmati.de>
References: <20201213175918.3143775-1-zgyarmati@zgyarmati.de>
Message-ID: <20201213212620.GJ3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2020-12-13 18:59 +0100, Zoltan Gyarmati spake thusly:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/proj/proj.hash | 6 +++---
>  package/proj/proj.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index 0d59d54e26..60b6b22c07 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
> -# Fetched from http://download.osgeo.org/proj/proj-7.1.1.tar.gz.md5
> -md5  b7ce84943dcf2b660b11c2ef9657dad5  proj-7.1.1.tar.gz
> +# Fetched from http://download.osgeo.org/proj/proj-7.2.0.tar.gz.md5
> +md5  12748b74e4d6c12ade32ec3ca68dafc7  proj-7.2.0.tar.gz
>  # Locally calculated
> -sha256  324e7abb5569fb5f787dadf1d4474766915c485a188cf48cf07153b99156b5f9  proj-7.1.1.tar.gz
> +sha256  2957798e5fe295ff96a2af1889d0428e486363d210889422f76dd744f7885763  proj-7.2.0.tar.gz
>  sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index 663db4abcc..3a390deb59 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PROJ_VERSION = 7.1.1
> +PROJ_VERSION = 7.2.0
>  PROJ_SITE = http://download.osgeo.org/proj
>  PROJ_LICENSE = MIT
>  PROJ_LICENSE_FILES = COPYING
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
