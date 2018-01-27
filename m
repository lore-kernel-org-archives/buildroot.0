From: Mark Hirota <markhirota@gmail.com>
Date: Fri, 26 Jan 2018 17:08:43 -0800
Subject: [Buildroot] [PATCH 1/1] ccache: bump to version 3.3.5
Message-ID: <20180127010843.50165-1-markhirota@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.buildroot.org/show_bug.cgi?id=10536

Signed-off-by: Mark Hirota <markhirota@gmail.com>
---
 package/ccache/ccache.hash | 1 +
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 5354572638..c22394b13b 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,3 @@
 # Verified key https://samba.org/ftp/ccache/ccache-3.3.4.tar.xz.asc - sha256 computed locally
 sha256  24f15bf389e38c41548c9c259532187774ec0cb9686c3497bbb75504c8dc404f  ccache-3.3.4.tar.xz
+sha256  190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6  ccache-3.3.5.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index afbec44fac..552a611f42 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.3.4
+CCACHE_VERSION = 3.3.5
 CCACHE_SITE = https://www.samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.14.3
