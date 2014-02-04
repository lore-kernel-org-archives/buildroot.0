From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Feb 2014 09:23:26 -0300
Subject: [Buildroot] [PATCH] mpg132: bump to version 1.18.0
Message-ID: <1391516606-17632-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a couple of buffer overflows so it should be considered as a
security bump (no CVEs though).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpg123/mpg123.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 70d3ed6..a950813 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.17.0
+MPG123_VERSION = 1.18.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --disable-lfs-alias
-- 
1.8.3.2
