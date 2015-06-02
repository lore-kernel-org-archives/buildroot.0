From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 13:58:01 -0300
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.22.2
Message-ID: <1433264281-22078-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index e9f04b4..bf81f2a 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.1/
-md5	abf310c716d56c283561eff0903bcb69	mpg123-1.22.1.tar.bz2
-sha1	c3193902b1cf923a625ed94360c91e28d84753d3	mpg123-1.22.1.tar.bz2
+# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.2/
+md5	6f6d2178c354f39207bf97e062936110	mpg123-1.22.2.tar.bz2
+sha1	9125b4eabf6327c71a439e07e16eb39b712085e2	mpg123-1.22.2.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index c9acb6b..a16e400 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.22.1
+MPG123_VERSION = 1.22.2
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.3.6
