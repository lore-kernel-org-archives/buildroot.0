From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 19:30:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: needs host-zlib
In-Reply-To: <20201001171441.529114-1-fontaine.fabrice@gmail.com>
References: <20201001171441.529114-1-fontaine.fabrice@gmail.com>
Message-ID: <20201001173016.GZ11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-01 19:14 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/bca6f0ef30bc8fdfa98f48c96de368dc4644a1f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sentry-cli/sentry-cli.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
> index 56b787c31f..c4dbc5ebfd 100644
> --- a/package/sentry-cli/sentry-cli.mk
> +++ b/package/sentry-cli/sentry-cli.mk
> @@ -9,7 +9,7 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
>  SENTRY_CLI_LICENSE = BSD-3-clause
>  SENTRY_CLI_LICENSE_FILES = LICENSE
>  
> -HOST_SENTRY_CLI_DEPENDENCIES = host-rustc
> +HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
>  
>  HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
>  
> -- 
> 2.28.0
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
