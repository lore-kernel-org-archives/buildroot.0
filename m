From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 29 Mar 2015 13:52:04 +0200
Subject: [Buildroot] [PATCH] package/ccache: bump version to 3.1.11
Message-ID: <1427629924-75317-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/ccache/ccache.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 270ea4b..893b6ae 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.1.8
+CCACHE_VERSION = 3.1.11
 CCACHE_SITE = http://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
-- 
1.7.10.4
