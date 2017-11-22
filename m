From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:29:44 +0100
Subject: [Buildroot] [git commit] libpng: bump to 1.6.34
Message-ID: <20171201205333.43CE67FAAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aceb8fa982c8a54f4799b32c006c3b91bc3328f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition, add a hash for the license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.hash | 10 ++++++----
 package/libpng/libpng.mk   |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 074cf5f..0a0cebe 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,7 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.32/
-md5 e01be057a9369183c959b793a685ad15  libpng-1.6.32.tar.xz
-sha1 161d91d15cfd739773e0a73b41032b9f27322914  libpng-1.6.32.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.34/
+md5		c05b6ca7190a5e387b78657dbe5536b2			libpng-1.6.34.tar.xz
+sha1	45de4ec996ffcc3e18037e7c128abe95f4d0292a	libpng-1.6.34.tar.xz
+
 # Locally computed:
-sha256 c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b  libpng-1.6.32.tar.xz
+sha256	2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6	libpng-1.6.34.tar.xz
+sha256	a247c24f82bacf0403fe2f3d5550493a91cdb575fe7036b764bda8cacf3efd9c	LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 2aa0217..f8594c8 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.32
+LIBPNG_VERSION = 1.6.34
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
