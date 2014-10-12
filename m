From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:14:21 +0200
Subject: [Buildroot] [git commit] mpg132: bump to version 1.21.0
Message-ID: <20141012072420.7ED8CB1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d634737592235d6c8351d40e528b3eff1baf0a20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash |    3 +++
 package/mpg123/mpg123.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
