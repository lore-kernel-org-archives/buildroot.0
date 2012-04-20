From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Apr 2012 13:57:08 +0200
Subject: [Buildroot] [git commit] mpg123: bump to 1.13.8
Message-ID: <20120420134204.A502496B2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dc432071f927df1a7477fc76c9a372c92c66c62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build errors for ARM arch using Linaro toolchain.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 8ea05a8..65523f3 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.13.4
+MPG123_VERSION = 1.13.8
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
