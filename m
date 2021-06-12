From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 13 Jun 2021 00:27:48 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/mpg123: bump version to 1.25.15
Message-ID: <20210612222749.25669-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <peter@korsgaard.com>

Bugfix release. From the release notes:

Some backports of important fixes to the 1.25 series, for very conservative
people.

libmpg123: Backport bit reservoir CRC fix from 1.26
libmpg123: Backport part2_3_length regression fix (bug 312).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 8 ++++----
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 02c40ad086..e5fb09b46a 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.13/
-sha1 2b6428dc563c56fb1374191d1244c8ac928e4d89  mpg123-1.25.13.tar.bz2
-md5 294a6c30546504ec3d0deac2b2ea22be  mpg123-1.25.13.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.15/
+sha1  286fcb83afad3ecbfea60434d3ee1b6d7f41bb7c  mpg123-1.25.15.tar.bz2
+md5  9a050d4b3573661c606f8095a3f34ca3  mpg123-1.25.15.tar.bz2
 # Locally calculated
-sha256 90306848359c793fd43b9906e52201df18775742dc3c81c06ab67a806509890a  mpg123-1.25.13.tar.bz2
+sha256  503a76d82d97f1a6513bbeb284e460a99fb17ef80f23a661d8fc026ce6adcbbc  mpg123-1.25.15.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 588a4ffc32..9aa9cd1c10 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.13
+MPG123_VERSION = 1.25.15
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.31.1
