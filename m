From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Aug 2019 17:29:07 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/php: security
 bump version to 7.3.8
Message-ID: <20190822152548.7379284391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d140b8702744e188c48119d9327769dcf26eb7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes: https://www.php.net/ChangeLog-7.php#7.3.8

Fixes CVE-2019-11042 & CVE-2019-11041

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b9833c6f520c70370e0f484f15d202148f1f08be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 30aa8bfcf6..1330eebbb3 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 ba067200ba649956b3a92ec8b71a6ed8ce8a099921212443c1bcf3260a29274c  php-7.3.7.tar.xz
+sha256 f6046b2ae625d8c04310bda0737ac660dc5563a8e04e8a46c1ee24ea414ad5a5  php-7.3.8.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index e0c1c4445d..b2d96b1ca9 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.7
+PHP_VERSION = 7.3.8
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
