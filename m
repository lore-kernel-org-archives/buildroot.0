From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 09:53:01 +0200
Subject: [Buildroot] [git commit] ccache: bump to version 3.3.2
Message-ID: <20161005075346.1388482236@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b28f867c06c2494c23d7fcd49a24d348767c1936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 81e0550..fdd0ddf 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.3.1.tar.xz.asc - sha256 computed locally
-sha256	c6d87a49cc6d7639636d289ed9a5f560bc2acf7ab698fe8ee14e9c9f15ba41c6	ccache-3.3.1.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.3.2.tar.xz.asc - sha256 computed locally
+sha256	907685cb23d8f82074b8d1a9b4ebabb36914d151ac7b96a840c68c08d1a14530	ccache-3.3.2.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index a93aabd..63907c2 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.3.1
+CCACHE_VERSION = 3.3.2
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
