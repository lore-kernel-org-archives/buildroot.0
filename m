From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  8 Nov 2016 00:02:32 +0100
Subject: [Buildroot] [PATCH] package/ccache: bump to version 3.3.3
Message-ID: <20161107230232.26087-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note, that version 3.3.3 of ccache fixes a bug [1] where the Linux
kernel image is the same even after changing the source code and
rebuilding it.

[1] https://github.com/ccache/ccache/issues/136

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index fdd0ddf..bde53f7 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.3.2.tar.xz.asc - sha256 computed locally
-sha256	907685cb23d8f82074b8d1a9b4ebabb36914d151ac7b96a840c68c08d1a14530	ccache-3.3.2.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.3.3.tar.xz.asc - sha256 computed locally
+sha256  3b02a745da1cfa9eb438af7147e0fd3545e2f6163de9e5b07da86f58859f04ec  ccache-3.3.3.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 63907c2..f174a5d 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.3.2
+CCACHE_VERSION = 3.3.3
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
-- 
2.10.2
