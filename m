From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 15 Sep 2020 19:50:00 +0200
Subject: [Buildroot] [PATCH v1] package/orc: bump version to 0.4.32
Message-ID: <20200915175000.31670-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/gstreamer-devel/2020-September/076116.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/orc/orc.hash | 6 +++---
 package/orc/orc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index c30a50112c..f48c2932ab 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/orc/orc-0.4.31.tar.xz.sha256sum
-sha256 a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075  orc-0.4.31.tar.xz
+# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.32.tar.xz.sha256sum
+sha256  a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0  orc-0.4.32.tar.xz
 
 # Locally calculated
-sha256 4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
+sha256  4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 51a9b78482..a93a4f875a 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.31
+ORC_VERSION = 0.4.32
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.28.0
