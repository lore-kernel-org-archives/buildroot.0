From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:27:58 +0200
Subject: [Buildroot] [git commit branch/next] mpg123: bump to version 1.14.1
Message-ID: <20120518202901.061B096D27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9b6a0c7d5700c38ba6a63f9dc5f467d26325776
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 65523f3..4635740 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.13.8
+MPG123_VERSION = 1.14.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
-MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
+MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 
