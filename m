From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 10:39:56 -0300
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.15.3
Message-ID: <1365341996-29446-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpg123/mpg123.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 43a558a..c65920f 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.15.1
+MPG123_VERSION = 1.15.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
-- 
1.8.1.5
