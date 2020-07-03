From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2020 21:52:46 +0200
Subject: [Buildroot] [PATCH] package/exempi: bump version to 2.5.2
In-Reply-To: <20200702233933.22423-1-sergio.prado@e-labworks.com>
References: <20200702233933.22423-1-sergio.prado@e-labworks.com>
Message-ID: <20200703195246.GA2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2020-07-02 20:39 -0300, Sergio Prado spake thusly:
> Also change the hash file to separate the fields by two spaces.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exempi/exempi.hash | 4 ++--
>  package/exempi/exempi.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
> index e8b71a483ea8..5ea968305386 100644
> --- a/package/exempi/exempi.hash
> +++ b/package/exempi/exempi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 100b3d5b1b3370bc2e31c0978991716c4a4478246a2ac2df6382054a0ae89bc8  exempi-2.5.1.tar.bz2
> -sha256 3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
> +sha256  52f54314aefd45945d47a6ecf4bd21f362e6467fa5d0538b0d45a06bc6eaaed5  exempi-2.5.2.tar.bz2
> +sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
> diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
> index 2b6bd4fa81fb..3790b16b3287 100644
> --- a/package/exempi/exempi.mk
> +++ b/package/exempi/exempi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXEMPI_VERSION = 2.5.1
> +EXEMPI_VERSION = 2.5.2
>  EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
>  EXEMPI_SITE = https://libopenraw.freedesktop.org/download
>  EXEMPI_INSTALL_STAGING = YES
> -- 
> 2.17.1
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
