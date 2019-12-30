From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:45:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.29.0
In-Reply-To: <20191230134737.909316-1-fontaine.fabrice@gmail.com>
References: <20191230134737.909316-1-fontaine.fabrice@gmail.com>
Message-ID: <20191230204517.GU26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-30 14:47 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/i2pd/i2pd.hash | 2 +-
>  package/i2pd/i2pd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
> index f104590f3a..0ae6ea05fb 100644
> --- a/package/i2pd/i2pd.hash
> +++ b/package/i2pd/i2pd.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256	809b37100f0f176432b01ab6edee96dc62b0f65d5bf7531e008a87117e742566	i2pd-2.24.0.tar.gz
> +sha256	fd0474c33b411593b9dc8197f3799d37d68455c11a9ee3994ec993a96388ec06	i2pd-2.29.0.tar.gz
>  sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
> diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
> index a064057f1f..c031145472 100644
> --- a/package/i2pd/i2pd.mk
> +++ b/package/i2pd/i2pd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -I2PD_VERSION = 2.24.0
> +I2PD_VERSION = 2.29.0
>  I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
>  I2PD_LICENSE = BSD-3-Clause
>  I2PD_LICENSE_FILES = LICENSE
> -- 
> 2.24.0
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
