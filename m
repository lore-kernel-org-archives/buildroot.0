From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:16:17 +0100
Subject: [Buildroot] [PATCH 1/3] package/libnpupnp: bump to version
 4.0.14
In-Reply-To: <20201213164209.940947-1-fontaine.fabrice@gmail.com>
References: <20201213164209.940947-1-fontaine.fabrice@gmail.com>
Message-ID: <20201213211617.GG3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-12-13 17:42 +0100, Fabrice Fontaine spake thusly:
> https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#_2020_11_15_libnpupnp_4_0_14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of three applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnpupnp/libnpupnp.hash | 4 ++--
>  package/libnpupnp/libnpupnp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
> index 53a0c16fd3..ce39db4d8d 100644
> --- a/package/libnpupnp/libnpupnp.hash
> +++ b/package/libnpupnp/libnpupnp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.11.tar.gz.sha256
> -sha256  15b73a5197e649afe44dd15002be131b4b0e20a2b2e9b7ea4a2000b9644fefae  libnpupnp-4.0.11.tar.gz
> +# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.14.tar.gz.sha256
> +sha256  ea5f5bf388bf8c028a25630c58e9a42762fddd357e7e2581b192856e01aad044  libnpupnp-4.0.14.tar.gz
>  
>  # Hash for license file:
>  sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
> index 23cc52c169..efffd7f8a5 100644
> --- a/package/libnpupnp/libnpupnp.mk
> +++ b/package/libnpupnp/libnpupnp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNPUPNP_VERSION = 4.0.11
> +LIBNPUPNP_VERSION = 4.0.14
>  LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>  LIBNPUPNP_LICENSE = BSD-3-Clause
>  LIBNPUPNP_LICENSE_FILES = COPYING
> -- 
> 2.29.2
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
