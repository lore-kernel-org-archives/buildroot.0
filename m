From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Oct 2014 18:55:05 -0300
Subject: [Buildroot] [PATCH 2/2] mpg132: bump to version 1.21.0
In-Reply-To: <1413064505-23839-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413064505-23839-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413064505-23839-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpg123/mpg123.hash | 3 +++
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/mpg123/mpg123.hash

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
new file mode 100644
index 0000000..22d16a7
--- /dev/null
+++ b/package/mpg123/mpg123.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/mpg123/files/mpg123/1.21.0/
+md5	13a9df5d4e7aa110e4ae27cf30128ce9	mpg123-1.21.0.tar.bz2
+sha1	a2fd84078632b7ab73ae4cd64c3f941d140167a8	mpg123-1.21.0.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 7ec8786..de21ec0 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.20.1
+MPG123_VERSION = 1.21.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.0.4
