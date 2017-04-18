From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 17:39:20 +0200
Subject: [Buildroot] [git commit] php: bump version to 7.1.4
Message-ID: <20170418153924.CF21B81E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f6357117b7a2b1ef747183834444030a5298478
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0e71c4b..35c5925 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 e4887c2634778e37fd962fbdf5c4a7d32cd708482fe07b448804625570cb0bb0  php-7.1.3.tar.xz
+sha256 71514386adf3e963df087c2044a0b3747900b8b1fc8da3a99f0a0ae9180d300b  php-7.1.4.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 22eeddd..46f57e4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.3
+PHP_VERSION = 7.1.4
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
