From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2015 19:52:06 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.0.1
Message-ID: <1438037526-19339-1-git-send-email-gustavo@zacarias.com.ar>
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
index 26f4688..daf495c 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.41.tar.bz2.sha256
-sha256	d81aa53d0c02b437beeaac159d7fc16394d676bbce0860fb6f6a10b587dc057c	harfbuzz-0.9.41.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.1.tar.bz2.sha256
+sha256	32a1a7ad584a2f2cfba5c1d234d046c0521e86e7a21d403e15e89aa509ef0ea8	harfbuzz-1.0.1.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 001405f..1d10a94 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 0.9.41
+HARFBUZZ_VERSION = 1.0.1
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.3.6
