From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 11:54:17 +0200
Subject: [Buildroot] [git commit] mpg123: bump to version 1.16.0
Message-ID: <20131007095748.267FF9B8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=334e4737dff70459815a9a2d181a44324e8d8119
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index e9d074f..3332249 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.15.4
+MPG123_VERSION = 1.16.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
