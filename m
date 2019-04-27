From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 27 Apr 2019 14:15:39 +0200
Subject: [Buildroot] [git commit] package/libpng: security bump to version
 1.6.37
Message-ID: <20190427121432.DA29481464@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc4ac7da33ca6605de4128fb22ce2258be0f551a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2019-7317: png_image_free in png.c in libpng 1.6.36 has a use-after-free
because png_image_free_function is called under png_safe_execute.

Update license hash for a change in copyright year and typo fixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libpng/libpng.hash | 10 +++++-----
 package/libpng/libpng.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 066d2c3bcd..e86b8c65ce 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.36/
-md5 df2be2d29c40937fe1f5349b16bc2826  libpng-1.6.36.tar.xz
-sha1 aec9548c8319104226cc4c31d1f5e524f1b55295  libpng-1.6.36.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/
+md5 015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
+sha1 3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
 # Locally computed:
-sha256 eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319  libpng-1.6.36.tar.xz
-sha256 142da07fb4b0cceb861b2e69fe7e5b602f25ec7adc85b0a426133d9ee0d2e116  LICENSE
+sha256 505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
+sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f956f9ce19..5c30a4f9ad 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.36
+LIBPNG_VERSION = 1.6.37
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
