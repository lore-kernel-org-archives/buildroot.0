From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jun 2020 22:59:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libresslL: bump version to 3.1.2
In-Reply-To: <20200603193441.801467-1-aduskett@gmail.com>
References: <20200603193441.801467-1-aduskett@gmail.com>
Message-ID: <20200604205900.GI13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-06-03 12:34 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

(oh no! I forgot to amend the title... :-( )

Regards,
Yann E. MORIN.

> ---
>  package/libressl/libressl.hash | 2 +-
>  package/libressl/libressl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> index fcecc2b434..6b53d54e45 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256 df7b172bf79b957dd27ef36dcaa1fb162562c0e8999e194aa8c1a3df2f15398e  libressl-3.0.2.tar.gz
> +sha256  f88a2f7ea617149a34e40c022d9912963f00eaa6109af421317525e6c978d892  libressl-3.1.2.tar.gz
>  # Locally computed
>  sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index c2491bb3a9..c703076268 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBRESSL_VERSION = 3.0.2
> +LIBRESSL_VERSION = 3.1.2
>  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING
> -- 
> 2.26.2
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
