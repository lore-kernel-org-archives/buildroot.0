From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:14:34 +0200
Subject: [Buildroot] [git commit] package/mpg123: security bump to version
 1.25.10
Message-ID: <20180610121237.BD22988075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb67c1d55b7b58d542ec1c4d0311543f40d5d0a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 1.25.4 fixes CVE-2017-9545, for details see release notes:
http://www.mpg123.org/cgi-bin/news.cgi

Added upstream hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpg123/mpg123.hash | 8 +++++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index cbab6f3ee9..22db5bca3c 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,5 +1,7 @@
-# Locally calculated after checking pgp signature
-sha256	5314b0fb8ad291bfc79ff4c5c321b971916819a65233ec065434358fcf8aee38	mpg123-1.25.2.tar.bz2
-
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.10/
+sha1 604784ddbcfe282bffdc595d1d45c677c7cf381f  mpg123-1.25.10.tar.bz2
+md5 ea32caa61d41d8be797f0b04a1b43ad9  mpg123-1.25.10.tar.bz2
+# Locally calculated
+sha256 6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023  mpg123-1.25.10.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 01923d7990..dd2d39d978 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.2
+MPG123_VERSION = 1.25.10
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
