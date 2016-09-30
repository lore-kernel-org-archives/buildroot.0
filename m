From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 13:38:22 +0200
Subject: [Buildroot] [PATCH] orc: bump to version 0.4.26
Message-ID: <20160930113822.5817-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.hash | 4 ++--
 package/orc/orc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 178d374..200467c 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/gstreamer-devel/2016-March/057056.html
-sha256	c1b1d54a58f26d483f0b3881538984789fe5d5460ab8fab74a1cacbd3d1c53d1	orc-0.4.25.tar.xz
+# From https://lists.freedesktop.org/archives/gstreamer-devel/2016-August/060159.html
+sha256	7d52fa80ef84988359c3434e1eea302d077a08987abdde6905678ebcad4fa649	orc-0.4.26.tar.xz
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 5a49cba..4456f53 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.25
+ORC_VERSION = 0.4.26
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2c, BSD-3c
-- 
2.9.3
