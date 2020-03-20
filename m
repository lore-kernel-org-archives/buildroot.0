From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Mar 2020 07:36:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 7.4.4
Message-ID: <20200320063652.684612-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.php.net/ChangeLog-7.php#7.4.4

Fixes CVE-2020-7064, CVE-2020-7065 & CVE-2020-7066.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a01e936016..4584524f1c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256 cf1f856d877c268124ded1ede40c9fb6142b125fdaafdc54f855120b8bc6982a  php-7.4.3.tar.xz
+sha256 1873c4cefdd3df9a78dcffb2198bba5c2f0464f55c9c960720c84df483fca74c  php-7.4.4.tar.xz
 
 # License file
 sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index c0abecad19..f62204c2a5 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.3
+PHP_VERSION = 7.4.4
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.25.0
