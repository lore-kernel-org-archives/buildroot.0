From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 08:22:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.25.13
Message-ID: <20191104072245.28786-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: http://www.mpg123.org/cgi-bin/news.cgi#2019-10-26

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpg123/mpg123.hash | 8 ++++----
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index e5a549b577..02c40ad086 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.12/
-sha1 4ece1ec124a6ca085e1d68f7ede6d5619fc587ff  mpg123-1.25.12.tar.bz2
-md5 ddb38254966eb38c77f220d456a1839d  mpg123-1.25.12.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.13/
+sha1 2b6428dc563c56fb1374191d1244c8ac928e4d89  mpg123-1.25.13.tar.bz2
+md5 294a6c30546504ec3d0deac2b2ea22be  mpg123-1.25.13.tar.bz2
 # Locally calculated
-sha256 1ffec7c9683dfb86ea9040d6a53d6ea819ecdda215df347f79def08f1fe731d1  mpg123-1.25.12.tar.bz2
+sha256 90306848359c793fd43b9906e52201df18775742dc3c81c06ab67a806509890a  mpg123-1.25.13.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 6247e54a0a..5e3b7fd94e 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.12
+MPG123_VERSION = 1.25.13
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.20.1
