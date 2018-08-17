From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Aug 2018 08:44:46 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/harfbuzz: bump version to 1.8.8
Message-ID: <20180817064446.20764-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added missing license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested with qt5base, vlc and test-pkg with BR2_PACKAGE_HARFBUZZ=y:

[...]
47 builds, 3 skipped, 0 build failed, 0 legal-info failed

 package/harfbuzz/harfbuzz.hash | 5 +++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 5f786dcb87..a10b4cfd5d 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,5 +1,6 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.7.1.tar.bz2.sha256
-sha256	9645a6e83313b690602017f18d4eb2adf81f2e54c6fc4471e19331304965154e	harfbuzz-1.7.1.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.8.8.tar.bz2.sha256
+sha256	a8e5c86e4d99e1cc9865ec1b8e9b05b98e413c2a885cd11f8e9bb9502dd3e3a9	harfbuzz-1.8.8.tar.bz2
 
 # Locally computed
 sha256	2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216	COPYING
+sha256	ec20cbe051200fc846caf4dc253cf660e874a2d9e4f3a682e08354b567fae409	src/hb-ucdn/COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 5708745fd2..52374c9c9e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.7.1
+HARFBUZZ_VERSION = 1.8.8
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.18.0
