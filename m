From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Jan 2012 18:16:07 +0100
Subject: [Buildroot] [git commit] ccache: bump version
Message-ID: <20120108171623.D0EDE8F678@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcf3103f0eee3c3d127f7e45f8cd4b94e7f418fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/ccache.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 87a64e5..9155441 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CCACHE_VERSION = 3.1.4
+CCACHE_VERSION = 3.1.7
 CCACHE_SITE    = http://samba.org/ftp/ccache
 CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
 
