From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:51:34 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.65
In-Reply-To: <20210514214035.127094-1-giulio.benetti@benettiengineering.com>
References: <20210514214035.127094-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210516165134.GO2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-05-14 23:40 +0200, Giulio Benetti spake thusly:
> Release Notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.65_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, after slightly rewording the commit log to state the
release notes are not yet available, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 92e9936d0d..02fda14eec 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_64_RTM/src/SHA256SUMS
> -sha256  d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126  nss-3.64.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_65_RTM/src/SHA256SUMS
> +sha256  32170f6c188212a78bf9fdacffa2eeed0d564ef8faae63fd8ae971b208e8c637  nss-3.65.tar.gz
>  # Locally calculated
>  sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 4c66bf876a..90f30698ff 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNSS_VERSION = 3.64
> +LIBNSS_VERSION = 3.65
>  LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>  LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>  LIBNSS_DISTDIR = dist
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
