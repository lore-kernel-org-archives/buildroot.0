From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jun 2016 21:52:55 -0300
Subject: [Buildroot] [PATCH] ifupdown: bump to version 0.8.13
Message-ID: <1465951975-20723-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ifupdown/ifupdown.hash | 4 ++--
 package/ifupdown/ifupdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index cd180ad..5f59d28 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.10.dsc
-sha256	d4730441b9234e5dcaab7dd688ad48ec17e130d1534a357b1c4fff13cf741b0c	ifupdown_0.8.10.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.13.dsc
+sha256	90938bf6a2bb31b0ed4d8b2be71beb909c334af64c9284b3f50820cbaeff49b6	ifupdown_0.8.13.tar.xz
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 1421a67..156496b 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.8.10
+IFUPDOWN_VERSION = 0.8.13
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160122T224509Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160604T232714Z/pool/main/i/ifupdown
 IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 IFUPDOWN_LICENSE = GPLv2+
 IFUPDOWN_LICENSE_FILES = COPYING
-- 
2.7.3
