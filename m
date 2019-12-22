From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:39:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/rygel: drop autoreconf
In-Reply-To: <20191222103342.2182120-1-fontaine.fabrice@gmail.com>
References: <20191222103342.2182120-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222103924.GW26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-22 11:33 +0100, Fabrice Fontaine spake thusly:
> autoreconf is not needed since bump to version 0.36.2 in commit
> 76f86c409d016851d4d63216ada969e6cd81dd56
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rygel/rygel.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
> index 5ffb6a9400..d87beda8c9 100644
> --- a/package/rygel/rygel.mk
> +++ b/package/rygel/rygel.mk
> @@ -17,8 +17,6 @@ RYGEL_DEPENDENCIES = \
>  	sqlite \
>  	$(TARGET_NLS_DEPENDENCIES)
>  RYGEL_INSTALL_STAGING = YES
> -# We're patching configure.ac
> -RYGEL_AUTORECONF = YES
>  
>  RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>  RYGEL_CONF_OPTS += \
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
