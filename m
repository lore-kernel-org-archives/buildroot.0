From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Apr 2016 18:36:06 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.2.5
Message-ID: <1459892166-14781-1-git-send-email-gustavo@zacarias.com.ar>
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
index 5e256cf..751f138 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.4.tar.bz2.sha256
-sha256	449dbdf12a8f94aedbdefaac831d8b1bf45e7decaa9192eaa4f74104ef9de491	harfbuzz-1.2.4.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.5.tar.bz2.sha256
+sha256	cfca0b6ba42c36a1f7b03fffb926dc4d137be2aa2a2ad8930259072e43a347d5	harfbuzz-1.2.5.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3869d6d..fe1d832 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.2.4
+HARFBUZZ_VERSION = 1.2.5
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.7.3
