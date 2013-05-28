From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:28:25 +0200
Subject: [Buildroot] [git commit] Revert "mpg123: bump to version 1.15.4"
Message-ID: <20130528213107.3D69F9A621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b85f5e8b457ffa1aad6e8063b5c6bbf6ca475eac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 609aa4156aa6fbda182856d3dab7df752c54eb78.

This was supposed to have been for next, not 2013.05.
---
 package/multimedia/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 8796392..c65920f 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.15.4
+MPG123_VERSION = 1.15.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
