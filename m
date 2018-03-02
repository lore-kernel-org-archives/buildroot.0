From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Mar 2018 07:58:29 +0100
Subject: [Buildroot] [git commit] package/php: security bump to version 7.2.3
Message-ID: <20180302073757.05BE781514@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee25f5c998d13e8dc2022783e4c1b5dd328985d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE 2018-7584: https://bugs.php.net/bug.php?id=75981

For details see release notes:
http://www.php.net/archive/2018.php#id2018-03-01-2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index fdb4446d2b..34230df874 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 47d7607d38a1d565fc43ea942c92229a7cd165f156737f210937e375b243cb11  php-7.2.2.tar.xz
+sha256 b3a94f1b562f413c0b96f54bc309706d83b29ac65d9b172bc7ed9fb40a5e651f  php-7.2.3.tar.xz
 
 # License file
 sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index e6bc1e47e1..dcb89b03d3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.2
+PHP_VERSION = 7.2.3
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
