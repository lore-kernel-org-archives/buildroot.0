From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 01:00:06 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/drbd-utils: bump version to
	8.9.6
Message-ID: <20170525230006.12893-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index ebd13ef09..0a38fdd39 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	38929279d1bf549fd1ade4ce6773a6fe209db51bbb0efe7bf6d2b7871ba0afbc	drbd-utils-8.9.4.tar.gz
+sha256 297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913  drbd-utils-8.9.6.tar.gz
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index f71a4aeca..7bac28bc8 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 8.9.4
+DRBD_UTILS_VERSION = 8.9.6
 DRBD_UTILS_SITE = http://oss.linbit.com/drbd
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
-- 
2.11.0
