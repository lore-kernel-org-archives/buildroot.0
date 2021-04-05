From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Apr 2021 11:52:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.3.0
In-Reply-To: <20210405094402.3541746-1-fontaine.fabrice@gmail.com>
References: <20210405094402.3541746-1-fontaine.fabrice@gmail.com>
Message-ID: <20210405095225.GP2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-05 11:44 +0200, Fabrice Fontaine spake thusly:
> https://github.com/libexpat/libexpat/blob/R_2_3_0/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/expat/expat.hash | 8 ++++----
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 5a8dd41280..dd448982fe 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/expat/files/expat/2.2.10/
> -md5  e0fe49a6b3480827c9455e4cfc799133  expat-2.2.10.tar.xz
> -sha1  a333b95121a718a77ee481dbade5efcd72a32eb8  expat-2.2.10.tar.xz
> +# From https://sourceforge.net/projects/expat/files/expat/2.3.0/
> +md5  1c1b523a8d917e6d9f7af4f8881d8ec5  expat-2.3.0.tar.xz
> +sha1  596a37d048b357a58990a538a8d83e2e38325122  expat-2.3.0.tar.xz
>  
>  # Locally calculated
> -sha256  5dfe538f8b5b63f03e98edac520d7d9a6a4d22e482e5c96d4d06fcc5485c25f2  expat-2.2.10.tar.xz
> +sha256  caa34f99b6e3bcea8502507eb6549a0a84510b244a748dfb287271b2d47467a9  expat-2.3.0.tar.xz
>  sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 4acbade2c8..04ea413e1b 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.2.10
> +EXPAT_VERSION = 2.3.0
>  EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
> -- 
> 2.30.2
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
