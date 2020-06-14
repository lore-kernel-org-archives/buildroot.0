From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 18:32:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.4.7
In-Reply-To: <20200613083214.954910-1-bernd.kuhls@t-online.de>
References: <20200613083214.954910-1-bernd.kuhls@t-online.de>
Message-ID: <20200614163228.GE2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-13 10:32 +0200, Bernd Kuhls spake thusly:
> Changelog: https://www.php.net/ChangeLog-7.php#7.4.7
> 
> Contrary to the release notification on the mailinglist
> https://news-web.php.net/php.announce/287
> which declares this release as "security bug fix release" no CVE IDs
> could be found on the bugtracker entries mentioned in the Changelog.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 0267375f6e..9789a99988 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  d740322f84f63019622b9f369d64ea5ab676547d2bdcf12be77a5a4cffd06832  php-7.4.6.tar.xz
> +sha256  53558f8f24cd8ab6fa0ea252ca8198e2650160649681ce5230c1df1dc2b52faf  php-7.4.7.tar.xz
>  
>  # License file
>  sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 73be57a8a1..ed71404c7b 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 7.4.6
> +PHP_VERSION = 7.4.7
>  PHP_SITE = http://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.26.2
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
