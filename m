From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 17:15:34 +0100
Subject: [Buildroot] [git commit branch/next] mpg123: bump to version 1.22.0
Message-ID: <20150225161643.275E3817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcd353d690ee5cee84a67b620a2b6fdc25c0e2c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash |    6 +++---
 package/mpg123/mpg123.mk   |    2 +-
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
