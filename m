From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 21:22:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.8.0
In-Reply-To: <20200503174503.1457099-1-bernd.kuhls@t-online.de>
References: <20200503174503.1457099-1-bernd.kuhls@t-online.de>
Message-ID: <20200503192224.GB12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-05-03 19:45 +0200, Bernd Kuhls spake thusly:
> Reformatted hashes.
> 
> Changelog: https://wiki.znc.in/ChangeLog/1.8.0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/znc/znc.hash | 4 ++--
>  package/znc/znc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/znc/znc.hash b/package/znc/znc.hash
> index f704e388cb..137829ee52 100644
> --- a/package/znc/znc.hash
> +++ b/package/znc/znc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 a8941e1385c8654287a4428018d93459482e9d5eeedf86bef7b020ddc5f24721  znc-1.7.5.tar.gz
> -sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> +sha256  94fdb227c1afa3abff468e0b7b1309120ad99d6aa64c4fd35bef02928171bd54  znc-1.8.0.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/znc/znc.mk b/package/znc/znc.mk
> index 3932c98020..95302071e1 100644
> --- a/package/znc/znc.mk
> +++ b/package/znc/znc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZNC_VERSION = 1.7.5
> +ZNC_VERSION = 1.8.0
>  ZNC_SITE = http://znc.in/releases/archive
>  ZNC_LICENSE = Apache-2.0
>  ZNC_LICENSE_FILES = LICENSE
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
