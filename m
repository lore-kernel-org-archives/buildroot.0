From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 17:26:02 -0300
Subject: [Buildroot] [PATCH] libtool: bump to version 2.4.5
Message-ID: <1421699162-30899-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtool/libtool.hash | 2 +-
 package/libtool/libtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index ffa3ea5..06a562d 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a8295b5853bf82a46635c944031e84970f2aa79c19df7a0c28f3ec8e11c07f6c	libtool-2.4.4.tar.xz
+sha256	84aac136513b009278896ffa255e4d685bcdb0cb0e5363be36adad64c986177e	libtool-2.4.5.tar.xz
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 92c6dce..3332cfc 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOOL_VERSION = 2.4.4
+LIBTOOL_VERSION = 2.4.5
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
-- 
2.0.5
