From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 12:33:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version
 7.2.5
In-Reply-To: <20180428095735.954-1-bernd.kuhls@t-online.de>
References: <20180428095735.954-1-bernd.kuhls@t-online.de>
Message-ID: <20180428123346.48deb91e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 11:57:35 +0200, Bernd Kuhls wrote:
> Changelog: http://www.php.net/ChangeLog-7.php#7.2.5
> 
> This release fixes several security-related bugs for which no CVE id's
> are assigned at the time of writing:
> 
> https://bugs.php.net/bug.php?id=76129
> https://bugs.php.net/bug.php?id=76130
> https://bugs.php.net/bug.php?id=76248
> https://bugs.php.net/bug.php?id=76249
> 
> Removed patch 0007, applied upstream:
> https://github.com/php/php-src/commit/2842aa2a078eb1cad55540b61e7edf111395150d
> 
> Re-numbered patch 0009 -> 0007.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...expat_compat.h-add-missing-php.h-include.patch} |  0
>  ...i.c-build-empty-php_load_zend_extension_c.patch | 62 ----------------------
>  package/php/php.hash                               |  2 +-
>  package/php/php.mk                                 |  2 +-
>  4 files changed, 2 insertions(+), 64 deletions(-)
>  rename package/php/{0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch => 0007-ext-xml-expat_compat.h-add-missing-php.h-include.patch} (100%)
>  delete mode 100644 package/php/0007-main-php_ini.c-build-empty-php_load_zend_extension_c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
