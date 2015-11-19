From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Nov 2015 13:47:09 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.1.0
Message-ID: <1447951629-13598-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 6dddf8d..3772242 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.6.tar.bz2.sha256
-sha256	f616a7fbdc78a627043f9029000bf08c0c71df59cde4143fc92a014f6a993b26	harfbuzz-1.0.6.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.0.tar.bz2.sha256
+sha256	0f584a5947e60ede565e7a4e122baa5e4b17a62eab872abf5f73d8552ceb716b	harfbuzz-1.1.0.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 48ff309..703e15c 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.0.6
+HARFBUZZ_VERSION = 1.1.0
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.4.10
