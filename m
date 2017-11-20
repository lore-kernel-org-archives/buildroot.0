From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 10:07:46 -0500
Subject: [Buildroot] [NEXT 1/1] harfbuzz: bump to 1.7.1
Message-ID: <20171120150746.32517-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, add a hash for the license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/harfbuzz/harfbuzz.hash | 7 +++++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index d44bd56..5f786dc 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,5 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.5.0.tar.bz2.sha256
-sha256 c088ec363be8d03f7708feb76dd22d5f102678e67d6ce63b02496ca0beb64ac1  harfbuzz-1.5.0.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.7.1.tar.bz2.sha256
+sha256	9645a6e83313b690602017f18d4eb2adf81f2e54c6fc4471e19331304965154e	harfbuzz-1.7.1.tar.bz2
+
+# Locally computed
+sha256	2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216	COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 0ee6a6b..5708745 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.5.0
+HARFBUZZ_VERSION = 1.7.1
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.13.6
