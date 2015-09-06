From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 10:48:22 +0200
Subject: [Buildroot] [git commit] package/php: security bump to version
	5.6.13
Message-ID: <20150906092939.45CBC7FCE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59dda508e59e3603cb58a9737a5b3383301ac66f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to release announcement:
http://php.net/archive/2015.php#id2015-09-04-2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6afc166..db01b43 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	f8a8446866c0dc3f33319aa196ce87b64d71cab3dd96e39c8816adccc7e8ef33	php-5.6.12.tar.xz
+sha256	c1f0837df20cd3bed149033924770deca3e7e2d18e2e7e81395096576f153fdc	php-5.6.13.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 6f746c4..3d21dee 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).12
+PHP_VERSION = $(PHP_VERSION_MAJOR).13
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
