From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2016 12:21:31 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.2.7
Message-ID: <1462202491-27154-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4b49c30..e8a909d 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.6.tar.bz2.sha256
-sha256	7537bacccb3524df0cd2a4d5bc7e168bcc10e8171e0324f3cd522583868192c1	harfbuzz-1.2.6.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.7.tar.bz2.sha256
+sha256	bba0600ae08b84384e6d2d7175bea10b5fc246c4583dc841498d01894d479026	harfbuzz-1.2.7.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c8bf206..8e8e7b6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.2.6
+HARFBUZZ_VERSION = 1.2.7
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.7.3
