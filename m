From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 23:00:09 +0100
Subject: [Buildroot] [git commit] mpg123: bump to version 1.23.3
Message-ID: <20160325220233.CFD0C818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c433b32102de25a88a896ef6ba74b07bb05b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 5 ++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index ae261d0..a6424d3 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/mpg123/files/mpg123/1.22.4/
-md5	2dfafae3bbc532b4c8b04a77c6a6de89	mpg123-1.22.4.tar.bz2
-sha1	6ca59baceeebe361cc508214ba725a56d4fea743	mpg123-1.22.4.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	5c431da7e7446fae586c9207772dc0038ce2bfe75f0274a7933d1b4a7d84e6c6	mpg123-1.23.3.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index f6bb297..00bb971 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.22.4
+MPG123_VERSION = 1.23.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
