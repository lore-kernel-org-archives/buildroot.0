From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Oct 2015 12:31:36 +0200
Subject: [Buildroot] [git commit] ccache: bump to version 3.2.3
Message-ID: <20151007103312.DC0ED7FC80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ef65bb8ae1585ffd899b3264214132535fa99bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.hash |    4 ++--
 package/ccache/ccache.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 56bf0d0..d4e33d5 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.2.2.tar.xz.asc - sha256 computed locally
-sha256	4f0d99699f24d198494addca0f41a93b0150cdfd01491f15a5d7eb02c7c2a0ca	ccache-3.2.2.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.2.3.tar.xz.asc - sha256 computed locally
+sha256	ec0414fc435982ece8b8fca062f5836ff32c5d5148abd7f80768614ed776600e	ccache-3.2.3.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 52cf309..167711d 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.2.2
+CCACHE_VERSION = 3.2.3
 CCACHE_SITE = https://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
