From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:11:11 +0100
Subject: [Buildroot] [git commit] harfbuzz: bump to version 1.3.4
Message-ID: <20161209171846.25A9780102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f329c399c1846f55352c2fd762338efba2f6c79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index aa864c6..b38b049 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.3.3.tar.bz2.sha256
-sha256	2620987115a4122b47321610dccbcc18f7f121115fd7b88dc8a695c8b66cb3c9	harfbuzz-1.3.3.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.3.4.tar.bz2.sha256
+sha256	718aa6fcadef1a6548315b8cfe42cc27e926256302c337f42df3a443843f6a2b	harfbuzz-1.3.4.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 2290eeb..eafe939 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.3.3
+HARFBUZZ_VERSION = 1.3.4
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
