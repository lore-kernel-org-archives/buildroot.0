From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 14:33:53 +0200
Subject: [Buildroot] [PATCH 1/3] libgpg-error: bump version to 1.24
In-Reply-To: <1468577323-2248-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468577323-2248-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160715123353.GA3692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2016-07-15 11:08 +0100, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Too late as it's already been applied, but you could have referenced the
numerous build failures that this fixes:
    http://autobuild.buildroot.org/?reason=libgpg-error-1.23

Regards,
Yann E. MORIN.

> ---
>  package/libgpg-error/libgpg-error.hash | 2 +-
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index 7e06b91..85d433d 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	0939cd4bd9bc027ae24a8b05a698af962b5af3d7a34c1fea15279ea69ea27abc	libgpg-error-1.23.tar.gz
> +sha256 88cb2d2370f8378fd38452b99dc1419a80fd5897739b7198a4a7996364507803  libgpg-error-1.24.tar.gz
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index b074ff6..4acd32c 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.23
> +LIBGPG_ERROR_VERSION = 1.24
>  LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
>  LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
>  LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
> -- 
> 2.7.3
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
