From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 23:02:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/skalibs: bump to version 2.9.2.1
In-Reply-To: <020235cf3f45c498c2d5ce483d8efef08a9a1709.1586798353.git.baruch@tkos.co.il>
References: <020235cf3f45c498c2d5ce483d8efef08a9a1709.1586798353.git.baruch@tkos.co.il>
Message-ID: <20200413210250.GC5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-04-13 20:19 +0300, Baruch Siach spake thusly:
> Update license hash; copyright year update.
> 
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/skalibs/skalibs.hash | 4 ++--
>  package/skalibs/skalibs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
> index bb5a60212f90..9d9505ed1095 100644
> --- a/package/skalibs/skalibs.hash
> +++ b/package/skalibs/skalibs.hash
> @@ -1,3 +1,3 @@
>  # Locally generated
> -sha256 d3b204afc462b9659e0c16f6df1c796e7612534f537eec053529f67ddcd086a5  skalibs-2.9.1.0.tar.gz
> -sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
> +sha256  250b99b53dd413172db944b31c1b930aa145ac79fe6c5d7e6869ef804228c539  skalibs-2.9.2.1.tar.gz
> +sha256  5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
> diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
> index 8b995f796161..1c73f26fe777 100644
> --- a/package/skalibs/skalibs.mk
> +++ b/package/skalibs/skalibs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SKALIBS_VERSION = 2.9.1.0
> +SKALIBS_VERSION = 2.9.2.1

Hmm... As far as I can see, we already have the updated versions for
skalibs and mdevd;

    https://git.buildroot.org/buildroot/commit/?id=149e604057e496e9b35588798e3bd32bee102e2c
    https://git.buildroot.org/buildroot/commit/?id=2e61e6a0779266e8d8c5b1909640c747db7a83d9

Regards,
Yann E. MORIN.

>  SKALIBS_SITE = http://skarnet.org/software/skalibs
>  SKALIBS_LICENSE = ISC
>  SKALIBS_LICENSE_FILES = COPYING
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
