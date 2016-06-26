From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:58:07 +0200
Subject: [Buildroot] [git commit] package/php: security bump version to 7.0.8
Message-ID: <20160626125813.2D1B781D72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a342452641bc364634eae0b9b97bb12d2b6d4edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog is available here: http://php.net/ChangeLog-7.php#7.0.8

Fixes CVE-2015-8874 http://bugs.php.net/66387
Fixes CVE-2016-5766 http://bugs.php.net/72339
Fixes CVE-2016-5767 http://bugs.php.net/72446
Fixes CVE-2016-5768 http://bugs.php.net/72402
Fixes CVE-2016-5769 http://bugs.php.net/72455
Fixes CVE-2016-5772 http://bugs.php.net/72340
Fixes CVE-2016-5773 http://bugs.php.net/72434

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index ace5281..f3718f1 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 9cc64a7459242c79c10e79d74feaf5bae3541f604966ceb600c3d2e8f5fe4794  php-7.0.7.tar.xz
+sha256 0a2142c458b0846f556b16da1c927d74c101aa951bb840549abe5c58584fb394  php-7.0.8.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 8dc70f0..f5cb224 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.7
+PHP_VERSION = 7.0.8
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
