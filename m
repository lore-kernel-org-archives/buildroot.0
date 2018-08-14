From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Aug 2018 17:31:16 +0200
Subject: [Buildroot] [PATCH v2] bzip2: change upstream site
In-Reply-To: <59cd8eb281eed8b9102b8d2a56aa6ff50f0a9a80.1534220691.git.baruch@tkos.co.il>
References: <59cd8eb281eed8b9102b8d2a56aa6ff50f0a9a80.1534220691.git.baruch@tkos.co.il>
Message-ID: <20180814153116.GL7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-14 07:24 +0300, Baruch Siach spake thusly:
> The bzip.org website is down. Use the Buildroot backup download site.
> Remove the website link as there is no clear alternative upstream at
> this point.
> 
>   https://lwn.net/Articles/762264/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bzip2/Config.in | 2 --
>  package/bzip2/bzip2.mk  | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
> index dbc82496df7e..ca447bbb2dc5 100644
> --- a/package/bzip2/Config.in
> +++ b/package/bzip2/Config.in
> @@ -5,5 +5,3 @@ config BR2_PACKAGE_BZIP2
>  	  It typically compresses files to within 10% to 15% of the best
>  	  available techniques, while being around twice as fast at
>  	  compression and six times faster at decompression.
> -
> -	  http://www.bzip.org
> diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
> index e43533072b2d..a3af32299370 100644
> --- a/package/bzip2/bzip2.mk
> +++ b/package/bzip2/bzip2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  BZIP2_VERSION = 1.0.6
> -BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
> +BZIP2_SITE = http://sources.buildroot.net
>  BZIP2_INSTALL_STAGING = YES
>  BZIP2_LICENSE = bzip2 license
>  BZIP2_LICENSE_FILES = LICENSE
> -- 
> 2.18.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
