From: Karoly Kasza <kaszak@gmail.com>
Date: Mon,  1 Jun 2015 15:17:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump to version 3.2.2
Message-ID: <1433164670-39296-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump ccache to minor version 3.2.2.
Also changed download URL to https.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 49012af..56bf0d0 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key http://samba.org/ftp/ccache/ccache-3.2.1.tar.xz.asc - sha256 computed locally
-sha256	872af34e1d2cef18694001d29db7f167d644e7602ca32cd6c74b28d81458bd9d	ccache-3.2.1.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.2.2.tar.xz.asc - sha256 computed locally
+sha256	4f0d99699f24d198494addca0f41a93b0150cdfd01491f15a5d7eb02c7c2a0ca	ccache-3.2.2.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 52b5c67..3bd2803 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.2.1
-CCACHE_SITE = http://samba.org/ftp/ccache
+CCACHE_VERSION = 3.2.2
+CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
-- 
2.1.4
