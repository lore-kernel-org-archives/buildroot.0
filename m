From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:33:18 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/php: bump version
 to 7.1.9
Message-ID: <20180129213709.2286988014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=231f5e9a4daa9d73341b9c93958226e7665ca5fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cee153b838f81a67c36a12e6f892451db5ec72fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c724f6d8ce..2c53d84495 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 0d42089729be7b2bb0308cbe189c2782f9cb4b07078c8a235495be5874fff729  php-7.1.7.tar.xz
+sha256 ec9ca348dd51f19a84dc5d33acfff1fba1f977300604bdac08ed46ae2c281e8c  php-7.1.9.tar.xz
 
 # License file
 sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0733bc9a2c..2cdd18d9dc 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.7
+PHP_VERSION = 7.1.9
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
