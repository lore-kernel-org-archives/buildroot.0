From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2015 21:51:06 +0200
Subject: [Buildroot] [git commit] mpg123: bump to version 1.22.1
Message-ID: <20150402200512.E438F8191B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b776b78bcf8e3395ca02c3b55da608979fafe1c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash |    6 +++---
 package/mpg123/mpg123.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 383dae5..e9f04b4 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.0/
-md5	33069bff83413824669c8ecb37e706d5	mpg123-1.22.0.tar.bz2
-sha1	0375e2aa11800d7d4d869ec84b93611e90583206	mpg123-1.22.0.tar.bz2
+# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.1/
+md5	abf310c716d56c283561eff0903bcb69	mpg123-1.22.1.tar.bz2
+sha1	c3193902b1cf923a625ed94360c91e28d84753d3	mpg123-1.22.1.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index bbad0b6..c2d7b1f 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.22.0
+MPG123_VERSION = 1.22.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
