From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:27:28 +0200
Subject: [Buildroot] [PATCH 1/2] php: rework patches as Git formatted
 patches
In-Reply-To: <1470736989-32265-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470736989-32265-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160810142728.15fa761b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 12:03:08 +0200, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ... 0001-acinclude.m4-don-t-unset-variables.patch} | 22 ++++++++++----
>  ...atch => 0002-iconv-tweak-iconv-detection.patch} | 30 ++++++++++++++-----
>  ... => 0003-configure-disable-the-phar-tool.patch} | 22 ++++++++++----
>  ...k-mechanism-is-obviously-linux-so-force-.patch} | 22 ++++++++++----
>  package/php/0005-ac-cache-strcasestr.patch         | 24 ---------------
>  ...o-config.m4-allow-cache-answer-for-strcas.patch | 35 ++++++++++++++++++++++
>  ....in.patch => 0006-Fix-php-fpm.service.in.patch} |  4 +--
>  7 files changed, 109 insertions(+), 50 deletions(-)
>  rename package/php/{0001-ditch-unset.patch => 0001-acinclude.m4-don-t-unset-variables.patch} (52%)
>  rename package/php/{0002-no-iconv-search.patch => 0002-iconv-tweak-iconv-detection.patch} (69%)
>  rename package/php/{0003-disable-pharcmd.patch => 0003-configure-disable-the-phar-tool.patch} (60%)
>  rename package/php/{0004-flock-type-linux.patch => 0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch} (66%)
>  delete mode 100644 package/php/0005-ac-cache-strcasestr.patch
>  create mode 100644 package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
>  rename package/php/{0006-fix-php-fpm.service.in.patch => 0006-Fix-php-fpm.service.in.patch} (93%)

I've applied both patches to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
