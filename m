From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:51:05 +0200
Subject: [Buildroot] [git commit] mpg123: bump to version 1.22.4
Message-ID: <20151002195300.6313181914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97da7c5521267d7da09391eceb7a345b44725c0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash |    6 +++---
 package/mpg123/mpg123.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index bf81f2a..ae261d0 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.2/
-md5	6f6d2178c354f39207bf97e062936110	mpg123-1.22.2.tar.bz2
-sha1	9125b4eabf6327c71a439e07e16eb39b712085e2	mpg123-1.22.2.tar.bz2
+# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.4/
+md5	2dfafae3bbc532b4c8b04a77c6a6de89	mpg123-1.22.4.tar.bz2
+sha1	6ca59baceeebe361cc508214ba725a56d4fea743	mpg123-1.22.4.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 171cbde..efd510d 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.22.2
+MPG123_VERSION = 1.22.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
