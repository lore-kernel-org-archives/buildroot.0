From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 22:14:41 +0200
Subject: [Buildroot] [PATCH v1 1/2] orc: bump version to 0.4.27
Message-ID: <20170724201442.6500-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/orc/orc.hash | 4 ++--
 package/orc/orc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 200467cf7f..f47a9cfe5f 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/gstreamer-devel/2016-August/060159.html
-sha256	7d52fa80ef84988359c3434e1eea302d077a08987abdde6905678ebcad4fa649	orc-0.4.26.tar.xz
+# From https://gstreamer.freedesktop.org/src/orc/orc-0.4.27.tar.xz.sha256sum
+sha256 51e53e58fc8158e5986a1f1a49a6d970c5b16493841cf7b9de2c2bde7ce36b93 orc-0.4.27.tar.xz
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 8e2b39a700..ab718296ac 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.26
+ORC_VERSION = 0.4.27
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.11.0
