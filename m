From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  5 Sep 2017 08:20:07 -0400
Subject: [Buildroot] [PATCH 1/1] harfbuzz: bump to 1.5.0
In-Reply-To: <20170905122010.19409-1-aduskett@gmail.com>
References: <20170905122010.19409-1-aduskett@gmail.com>
Message-ID: <20170905122010.19409-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index f48719194..d44bd561b 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.6.tar.bz2.sha256
-sha256 21a78b81cd20cbffdb04b59ac7edfb410e42141869f637ae1d6778e74928d293  harfbuzz-1.4.6.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.5.0.tar.bz2.sha256
+sha256 c088ec363be8d03f7708feb76dd22d5f102678e67d6ce63b02496ca0beb64ac1  harfbuzz-1.5.0.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f9814cac5..0ee6a6b0f 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.6
+HARFBUZZ_VERSION = 1.5.0
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.13.5
