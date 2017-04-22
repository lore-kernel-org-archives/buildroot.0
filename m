From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 09:35:33 +0200
Subject: [Buildroot] [PATCH v5 04/34] package/libcec: bump version to
 4.0.2
In-Reply-To: <20170417195433.26672-5-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-5-bernd.kuhls@t-online.de>
Message-ID: <20170422073533.GD15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libcec/libcec.hash | 2 +-
>  package/libcec/libcec.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
> index 377f343a2..5416c20fe 100644
> --- a/package/libcec/libcec.hash
> +++ b/package/libcec/libcec.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  0f29d5a2d155b507807ba896bc3b3e50a0ab56bf8f543a2bf5c2798c790292b5  libcec-2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd.tar.gz
> +sha256 b8b8dd31f3ebdd5472f03ab7d401600ea0d959b1288b9ca24bf457ef60e2ba27  libcec-4.0.2.tar.gz
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> index e2b5c1fb4..6d1444795 100644
> --- a/package/libcec/libcec.mk
> +++ b/package/libcec/libcec.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBCEC_VERSION = 2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd
> -LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
> +LIBCEC_VERSION = 4.0.2
> +LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
>  LIBCEC_LICENSE = GPL-2.0+
>  LIBCEC_LICENSE_FILES = COPYING
>  
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
