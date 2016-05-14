From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 12:28:45 -0300
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.23.4
Message-ID: <1463239725-13348-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpg123/mpg123.hash | 2 +-
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index a6424d3..6732206 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5c431da7e7446fae586c9207772dc0038ce2bfe75f0274a7933d1b4a7d84e6c6	mpg123-1.23.3.tar.bz2
+sha256	3495e678dec9a60f29cbcd4fc698abc4c811ec60d1276e744f7a10ac35023b48	mpg123-1.23.4.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 00bb971..ab75fbd 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.23.3
+MPG123_VERSION = 1.23.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.7.3
