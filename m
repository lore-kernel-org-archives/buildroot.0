From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:43:17 +0200
Subject: [Buildroot] [git commit] package/php: security bump to version
	5.6.12
Message-ID: <20150810134408.810138185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ccc4c9cf5e3e7377081e61b43253aacf9f3aa97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://www.php.net/ChangeLog-5.php#5.6.12
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index ea12138..6afc166 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	3f97dbb1c646b90e1ef638defabe429ef036f903b5baa1c34769d3de4fe62bd4	php-5.6.11.tar.xz
+sha256	f8a8446866c0dc3f33319aa196ce87b64d71cab3dd96e39c8816adccc7e8ef33	php-5.6.12.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 4b171cf..6f746c4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).11
+PHP_VERSION = $(PHP_VERSION_MAJOR).12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
