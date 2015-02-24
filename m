From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Feb 2015 10:51:40 -0300
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.22.0
Message-ID: <1424785900-912-1-git-send-email-gustavo@zacarias.com.ar>
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
index 22d16a7..383dae5 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/mpg123/files/mpg123/1.21.0/
-md5	13a9df5d4e7aa110e4ae27cf30128ce9	mpg123-1.21.0.tar.bz2
-sha1	a2fd84078632b7ab73ae4cd64c3f941d140167a8	mpg123-1.21.0.tar.bz2
+# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.0/
+md5	33069bff83413824669c8ecb37e706d5	mpg123-1.22.0.tar.bz2
+sha1	0375e2aa11800d7d4d869ec84b93611e90583206	mpg123-1.22.0.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 0341ed9..bbad0b6 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.21.0
+MPG123_VERSION = 1.22.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.0.5
