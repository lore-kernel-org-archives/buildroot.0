From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Mar 2016 16:50:35 -0300
Subject: [Buildroot] [PATCH] orc: bump to version 0.4.25
Message-ID: <1458071435-7966-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/orc/orc.hash | 4 ++--
 package/orc/orc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 100f194..178d374 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2015-June/053346.html
-sha256	338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b  orc-0.4.24.tar.xz
+# From https://lists.freedesktop.org/archives/gstreamer-devel/2016-March/057056.html
+sha256	c1b1d54a58f26d483f0b3881538984789fe5d5460ab8fab74a1cacbd3d1c53d1	orc-0.4.25.tar.xz
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 5d84bd0..5a49cba 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.24
+ORC_VERSION = 0.4.25
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2c, BSD-3c
-- 
2.4.10
