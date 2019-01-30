From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:14:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/s6-linux-utils: bump to 2.5.0.0
Message-ID: <20190130201436.9514-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

In 2.4.0.2, compilation under glibc 2.28 is fixed.
While at it, bump to the latest released version 2.5.0.0.

From the NEWS file:

In 2.5.0.0
----------
 - Optional nsss support.
 - s6-devd, s6-uevent-listener, s6-uevent-spawner removed.

In 2.4.0.2
----------
 - s6-logwatch rewrite.
 - Better portability with old glibc versions.
 - s6-uevent-listener and s6-uevent-spawner are marked as deprecated. (The
   mdevd package obsoletes them.)

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/s6-linux-utils/s6-linux-utils.hash | 2 +-
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 34fc5ea9b1..51c1a1cf3e 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 9562ef293c916c4448d16fcbbc065eb28fd995ac34cd3538179cbc3ee056ab93  s6-linux-utils-2.4.0.1.tar.gz
+sha256 78571574464c76fc623ef50dc14800138b4fd98c5fa877af6850fdd9c2f90213  s6-linux-utils-2.5.0.0.tar.gz
 sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 3f1745708d..619f4c3732 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.4.0.1
+S6_LINUX_UTILS_VERSION = 2.5.0.0
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
-- 
2.19.2
