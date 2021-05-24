From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:59:50 +0200
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3350500
In-Reply-To: <20210522191426.1979881-1-francois.perrad@gadz.org>
References: <20210522191426.1979881-1-francois.perrad@gadz.org>
Message-ID: <20210524125950.GY3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-05-22 21:14 +0200, Francois Perrad spake thusly:
> Release notes: https://www.sqlite.org/releaselog/3_35_5.html
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sqlite/Config.in   | 2 +-
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
> index 87c0f6c07..0ae9878d7 100644
> --- a/package/sqlite/Config.in
> +++ b/package/sqlite/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_SQLITE
>  	  self-contained, embeddable, zero-configuration SQL database
>  	  engine.
>  
> -	  http://www.sqlite.org/
> +	  https://www.sqlite.org/
>  
>  if BR2_PACKAGE_SQLITE
>  
> diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
> index 02b0e7132..ec6654322 100644
> --- a/package/sqlite/sqlite.hash
> +++ b/package/sqlite/sqlite.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  2a3bca581117b3b88e5361d0ef3803ba6d8da604b1c1a47d902ef785c1b53e89  sqlite-autoconf-3340100.tar.gz
> +sha256  f52b72a5c319c3e516ed7a92e123139a6e87af08a2dc43d7757724f6132e6db0  sqlite-autoconf-3350500.tar.gz
>  sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 2c2928f27..8e864ba2e 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -SQLITE_VERSION = 3340100
> -SQLITE_CPE_ID_VERSION = 3.34.1
> +SQLITE_VERSION = 3350500
> +SQLITE_CPE_ID_VERSION = 3.35.5
>  SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
>  SQLITE_SITE = https://www.sqlite.org/2021
>  SQLITE_LICENSE = Public domain
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
