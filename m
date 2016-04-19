From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Apr 2016 13:00:27 -0300
Subject: [Buildroot] [PATCH] ccache: bump to version 3.2.5
Message-ID: <1461081627-10597-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 483243b..7e616ce 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.2.4.tar.xz.asc - sha256 computed locally
-sha256	1c3da93f654e78a4ac71a54b0f63b19bc0fef9aa5522f4ebb9c201d4361cea5d	ccache-3.2.4.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.2.5.tar.xz.asc - sha256 computed locally
+sha256	117011534b199dbe290b08acae1591c81525536a1e140da22e0fbc04c20bab85	ccache-3.2.5.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index bce801e..c4f0310 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.2.4
+CCACHE_VERSION = 3.2.5
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
-- 
2.7.3
