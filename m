From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Feb 2016 23:19:41 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.2.0
Message-ID: <1456107581-17129-1-git-send-email-gustavo@zacarias.com.ar>
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
index 67050a7..b7330fc 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.3.tar.bz2.sha256
-sha256	d93d7cb7979c32672e902fdfa884599e63f07f2fa5b06c66147d20c516d4b8f7	harfbuzz-1.1.3.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.0.tar.bz2.sha256
+sha256	79ff5305153d15931fbdda80c9612783b0283dee44f4c2af71aa37353daaa685	harfbuzz-1.2.0.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c704f32..7cdc356 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.1.3
+HARFBUZZ_VERSION = 1.2.0
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.4.10
