From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 23:21:22 +0200
Subject: [Buildroot] [git commit] ccache: bump to version 3.3
Message-ID: <20160902142941.539137FA6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca6811fe84477c15255a2f3b8c9c31c0337591a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 7e616ce..03b8c26 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.2.5.tar.xz.asc - sha256 computed locally
-sha256	117011534b199dbe290b08acae1591c81525536a1e140da22e0fbc04c20bab85	ccache-3.2.5.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.3.tar.xz.asc - sha256 computed locally
+sha256	d88e6f5f62f9ce5eeee673972a5731f76e22a5c708cfbc264ecd25a93fffba07	ccache-3.3.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index c4f0310..06deb65 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.2.5
+CCACHE_VERSION = 3.3
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
