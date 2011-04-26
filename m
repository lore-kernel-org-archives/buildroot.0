From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 15:03:49 +0200
Subject: [Buildroot] [git commit] libraw: bump version
Message-ID: <20110426131525.2224782A51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a6c692160207df2e0416bef0a4099724fa65e58b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libraw/libraw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index b76fbbe..7d03f40 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBRAW_VERSION = 0.13.1
+LIBRAW_VERSION = 0.13.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data/
 
-- 
1.7.3.4
