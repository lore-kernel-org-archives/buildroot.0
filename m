From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 10:26:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.4.1
In-Reply-To: <20210524073430.1622919-1-fontaine.fabrice@gmail.com>
References: <20210524073430.1622919-1-fontaine.fabrice@gmail.com>
Message-ID: <20210524082621.GG3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-24 09:34 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2013-0340 "Billion Laughs":
> https://blog.hartwork.org/posts/cve-2013-0340-billion-laughs-fixed-in-expat-2-4-0/
> 
> https://github.com/libexpat/libexpat/blob/R_2_4_1/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Loled to lol, lol.

Regards,
Yann E. MORIN.

> ---
>  package/expat/expat.hash | 8 ++++----
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index dd448982fe..8cf563d8f5 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/expat/files/expat/2.3.0/
> -md5  1c1b523a8d917e6d9f7af4f8881d8ec5  expat-2.3.0.tar.xz
> -sha1  596a37d048b357a58990a538a8d83e2e38325122  expat-2.3.0.tar.xz
> +# From https://sourceforge.net/projects/expat/files/expat/2.4.1/
> +md5  a4fb91a9441bcaec576d4c4a56fa3aa6  expat-2.4.1.tar.xz
> +sha1  7988e4df355162500f09837aa95cbb48e6754420  expat-2.4.1.tar.xz
>  
>  # Locally calculated
> -sha256  caa34f99b6e3bcea8502507eb6549a0a84510b244a748dfb287271b2d47467a9  expat-2.3.0.tar.xz
> +sha256  cf032d0dba9b928636548e32b327a2d66b1aab63c4f4a13dd132c2d1d2f2fb6a  expat-2.4.1.tar.xz
>  sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 04ea413e1b..bb1cfd8c8a 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.3.0
> +EXPAT_VERSION = 2.4.1
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
