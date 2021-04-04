From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Apr 2021 19:48:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/ell: bump version to 0.39
Message-ID: <20210404174858.1889335-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Needed for bluez5_utils bump to 5.58:
http://www.bluez.org/release-of-bluez-5-58-and-5-57/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index cbefd79bb8..a795b1aa0d 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7767306f20db41c28b3138b5323bca05fef92238b6b61f81f66c2af684a13886  ell-0.38-br1.tar.gz
+sha256  deacff70541b2b0aa61758d7e4eafbabd8c603eeea0207a8a2f5f42118c2f49d  ell-0.39-br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 18f1cf2aac..c83063feda 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.38
+ELL_VERSION = 0.39
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.29.2
