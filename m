From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:44:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: set
 E2FSPROGS_CPE_ID_VALID
In-Reply-To: <20210302132456.361055-1-fontaine.fabrice@gmail.com>
References: <20210302132456.361055-1-fontaine.fabrice@gmail.com>
Message-ID: <20210302204426.GF2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-02 14:24 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:e2fsprogs_project:e2fsprogs is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ae2fsprogs_project%3Ae2fsprogs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, along with the 11 other onces:

    python-pyyaml
    dovecot-pigeonhole
    giflib
    nmap
    ruby
    gd
    libfribidi
    jpeg-turbo
    tiff
    rabbitmq-c
    libpam-tacplus

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/e2fsprogs/e2fsprogs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index eb82a55ce7..e2d6263c4e 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -9,6 +9,7 @@ E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
>  E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
>  E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
>  E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
> +E2FSPROGS_CPE_ID_VALID = YES
>  E2FSPROGS_INSTALL_STAGING = YES
>  
>  # Use libblkid and libuuid from util-linux for host and target packages.
> -- 
> 2.30.0
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
