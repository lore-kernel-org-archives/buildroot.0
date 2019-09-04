From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:47:08 +0200
Subject: [Buildroot] [git commit] package/libogg: bump version to 1.3.4
Message-ID: <20190904194616.4AE378B530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7001c64848c87fb39b39ce2964936da239782e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libogg/libogg.hash | 4 +++-
 package/libogg/libogg.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index d6962a55ed..5d95c85d3a 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,5 +1,7 @@
 # From: http://www.xiph.org/downloads/
-sha256 4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08 libogg-1.3.3.tar.xz
+md5 eadef24aad6e3e8379ba0d14971fd64a  libogg-1.3.4.tar.xz
+sha1 f07499a35566aa62affb5ca989f62eed5b8092c3  libogg-1.3.4.tar.xz
+sha256 c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe  libogg-1.3.4.tar.xz
 
 # Hash for license file:
 sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814 COPYING
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 4c97e9a913..08e5f87b72 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.3
+LIBOGG_VERSION = 1.3.4
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
