From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Aug 2019 20:16:20 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/harfbuzz: bump version to 2.6.1
Message-ID: <20190825181620.7976-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 8aa4265e8a..2fe3276737 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,5 +1,5 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.5.3.tar.xz.sha256
-sha256 fed00dc797b7ba3ca943225f0a854baaed4c1640fff8a31d455cd3b5caec855c  harfbuzz-2.5.3.tar.xz
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.6.1.tar.xz.sha256
+sha256 c651fb3faaa338aeb280726837c2384064cdc17ef40539228d88a1260960844f  harfbuzz-2.6.1.tar.xz
 
 # Locally computed
 sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3f12a4563d..9b4d9c2e77 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.5.3
+HARFBUZZ_VERSION = 2.6.1
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.20.1
