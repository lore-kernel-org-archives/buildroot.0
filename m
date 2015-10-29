From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 29 Oct 2015 15:56:51 -0300
Subject: [Buildroot] [PATCH] ccache: bump to version 3.2.4
Message-ID: <1446145011-19797-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index d4e33d5..483243b 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.2.3.tar.xz.asc - sha256 computed locally
-sha256	ec0414fc435982ece8b8fca062f5836ff32c5d5148abd7f80768614ed776600e	ccache-3.2.3.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.2.4.tar.xz.asc - sha256 computed locally
+sha256	1c3da93f654e78a4ac71a54b0f63b19bc0fef9aa5522f4ebb9c201d4361cea5d	ccache-3.2.4.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 167711d..bce801e 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.2.3
+CCACHE_VERSION = 3.2.4
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
-- 
2.4.10
