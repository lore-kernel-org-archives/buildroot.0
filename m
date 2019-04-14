From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 22:33:22 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/php: security
 bump to version 7.3.4
Message-ID: <20190414202935.875A981597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2825e92a9cef97a1e8ffaa214d309bc9f84c110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Changelog: https://www.php.net/ChangeLog-7.php#7.3.4

Fixes these bugs, CVE-ID were not assigned yet:

    Fixed bug #77753 (Heap-buffer-overflow in php_ifd_get32s).
    Fixed bug #77831 (Heap-buffer-overflow in exif_iif_add_value).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 614c1e2edde9378f87572412d0f86c24308d6547)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 8a9814d10e..fb25521955 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 6bb03e79a183d0cb059a6d117bbb2e0679cab667fb713a13c6a16f56bebab9b3  php-7.3.3.tar.xz
+sha256 6fe79fa1f8655f98ef6708cde8751299796d6c1e225081011f4104625b923b83  php-7.3.4.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ea6deca7c1..541c76755f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.3
+PHP_VERSION = 7.3.4
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
