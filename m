From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 13 Aug 2015 22:22:28 +0200
Subject: [Buildroot] [PATCH next 1/1] package/libpfm4: bump to version 4.6.0
Message-ID: <1439497348-7543-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also use checksum from sourceforge.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libpfm4/libpfm4.hash | 5 +++--
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index bc0ce52..30e65a5 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  a23eb9affbff279e13563a39317c0ad71c4de28908d4243c8bc109138430cc3b  libpfm-4.3.0.tar.gz
+# From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
+sha1  2ed06d6e746f7b1cd4b70e9736e621052f60d625  libpfm-4.6.0.tar.gz
+md5  5077b9022440e4951d96f2d0e73bd487  libpfm-4.6.0.tar.gz
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 7f14758..147be7c 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.3.0
+LIBPFM4_VERSION = 4.6.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
-- 
2.5.0
