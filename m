From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Oct 2011 20:57:02 +0200
Subject: [Buildroot] [git commit] mpg123: bump to version 1.13.4
Message-ID: <20111002191514.2CC5E8E04A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=455eb18a5a26d55ba98a2ac969a7e45f14f3f79d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump mpg123 to version 1.13.4, fixes for very long files (endless
streams).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 17d398e..53b7b39 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.13.3
+MPG123_VERSION = 1.13.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
