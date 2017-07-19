From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:09:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] php: bump to version 7.1.2
Message-ID: <20170720055507.C37F3800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=466ab1420af9b4941b3cfcaf64ec5eb38d0de6d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

7.1.2 is a bugfix release, fixing a number of issues:

http://www.php.net/ChangeLog-7.php#7.1.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 34d19a23ad8d46166a83da9cd84910ae1c5b2a43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9c94b9e..47e99d4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 b3565b0c1441064eba204821608df1ec7367abff881286898d900c2c2a5ffe70  php-7.1.1.tar.xz
+sha256 d815a0c39fd57bab1434a77ff0610fb507c22f790c66cd6f26e27030c4b3e971  php-7.1.2.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 1379ad5..5b113d1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.1
+PHP_VERSION = 7.1.2
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
