From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Apr 2017 00:46:53 +0200
Subject: [Buildroot] [PATCH 2/3] package/libdrm: bump version to 2.4.76
In-Reply-To: <20170401190823.11566-2-bernd.kuhls@t-online.de>
References: <20170401190823.11566-1-bernd.kuhls@t-online.de>
 <20170401190823.11566-2-bernd.kuhls@t-online.de>
Message-ID: <20170401224653.GA2486@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-04-01 21:08 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdrm/libdrm.hash | 4 ++--
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
> index dc10b295f..f9d82174c 100644
> --- a/package/libdrm/libdrm.hash
> +++ b/package/libdrm/libdrm.hash
> @@ -1,2 +1,2 @@
> -# From https://lists.freedesktop.org/archives/dri-devel/2017-January/131209.html
> -sha256 2d5a500eef412cc287d12268eed79d571e262d4957a2ec9258073f305985054f  libdrm-2.4.75.tar.bz2
> +# From https://lists.freedesktop.org/archives/dri-devel/2017-March/137337.html
> +sha256 7cdfb83ea77def453299dd95332aa9257c9f3534ff5844f5c0ce87265c275f3a  libdrm-2.4.76.tar.bz2
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index ae7b75bad..8ece196d2 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDRM_VERSION = 2.4.75
> +LIBDRM_VERSION = 2.4.76

Not sure I understand: this patch has been applied ~3h ago by Thomas...

Regards,
Yann E. MORIN.

>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
>  LIBDRM_SITE = http://dri.freedesktop.org/libdrm
>  LIBDRM_LICENSE = MIT
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
