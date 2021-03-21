From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:29:08 +0100
Subject: [Buildroot] [PATCH] package/libressl: security bump to 3.2.5
In-Reply-To: <20210320230337.1841-1-ismael@iodev.co.uk>
References: <20210320230337.1841-1-ismael@iodev.co.uk>
Message-ID: <20210321102908.GD3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ismael, All,

On 2021-03-21 00:03 +0100, Ismael Luceno spake thusly:
> It includes the following bug fix:
> 
>  * A TLS client using session resumption may cause a use-after-free.
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.5-relnotes.txt
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libressl/libressl.hash | 2 +-
>  package/libressl/libressl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> index 0dd0ffcaed03..9f216bf2f143 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  412dc2baa739228c7779e93eb07cd645d5c964d2f2d837a9fd56db7498463d73  libressl-3.2.3.tar.gz
> +sha256  798a65fd61d385e09d559810cdfa46512f8def5919264cfef241a7b086ce7cfe  libressl-3.2.5.tar.gz
>  # Locally computed
>  sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index 654b8bda2622..ad345ba3f091 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBRESSL_VERSION = 3.2.3
> +LIBRESSL_VERSION = 3.2.5
>  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING
> -- 
> 2.31.0
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
