From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Oct 2015 09:39:01 +0100
Subject: [Buildroot] [git commit] php: bump to version 5.6.15
Message-ID: <20151031090244.DAC7881910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=567a7c3dfadbe0304b5990a465000fba130dfa46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a0b12a2..e4a3e73 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	c8edf6b05fd8a69ebd88d90c5c0975ee168502204622ad5cfcd550bc222632d9	php-5.6.14.tar.xz
+sha256	cf52e2e621e60997269663fa4bc06253191fa2a41dc9b08c8c911435b3ebcca9	php-5.6.15.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index a90913f..76e3d62 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).14
+PHP_VERSION = $(PHP_VERSION_MAJOR).15
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
