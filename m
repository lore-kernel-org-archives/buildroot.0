From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 11:55:54 +0200
Subject: [Buildroot] [git commit] ccache: bump to version 3.3.1
Message-ID: <20160915095728.7D2D982249@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b644b9c35b7933d59cc52f993cce5391b3d04376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 03b8c26..81e0550 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.3.tar.xz.asc - sha256 computed locally
-sha256	d88e6f5f62f9ce5eeee673972a5731f76e22a5c708cfbc264ecd25a93fffba07	ccache-3.3.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.3.1.tar.xz.asc - sha256 computed locally
+sha256	c6d87a49cc6d7639636d289ed9a5f560bc2acf7ab698fe8ee14e9c9f15ba41c6	ccache-3.3.1.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 06deb65..a93aabd 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.3
+CCACHE_VERSION = 3.3.1
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
