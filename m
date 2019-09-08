From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:11:12 -0700
Subject: [Buildroot] [PATCH 08/27] package/liblinear: bump to version 2.30
Message-ID: <20190908161112.26213-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash for license file (update in year).

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/liblinear/liblinear.hash | 4 ++--
 package/liblinear/liblinear.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 9644bc02dd..4430d29989 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3f9fef20e76267bed1b817c9dc96d561ab5ee487828109bd44ed268fbf42048f	liblinear-2.20.tar.gz
-sha256	2ad9363447d0afeca34d53619163cffd502ec172bdb44d8d112c7acb99ae2558	COPYRIGHT
+sha256 881c7039c6cf93119c781fb56263de91617b3eca8c3951f2c19a3797de95c6ac liblinear-2.30.tar.gz
+sha256 c366abf1cb3a003d8c6e6d9c111a23c432db1d001294f88d479b70b60d7c0af2 COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index e1a0d10909..2d0fd0013c 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.20
+LIBLINEAR_VERSION = 2.30
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
-- 
2.20.1
