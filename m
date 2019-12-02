From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 08:47:51 -0000
Subject: [Buildroot] [git commit] package/libcurl: bump to 7.67.0
Message-ID: <20191202083933.5FB5C80262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e51830407f67b72360aa0d55079aa8ea1cfbd700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 6 ++----
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 8f2d0c058c..b46ee52d04 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,3 @@
-# Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.66.0.tar.xz.asc
-# with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 dbb48088193016d079b97c5c3efde8efa56ada2ebf336e8a97d04eb8e2ed98c1  curl-7.66.0.tar.xz
+# Locally calculated
+sha256 f5d2e7320379338c3952dcc7566a140abb49edb575f9f99272455785c40e536c  curl-7.67.0.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8384210d48..373befae13 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.66.0
+LIBCURL_VERSION = 7.67.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
