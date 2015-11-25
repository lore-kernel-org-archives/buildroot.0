From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:23:06 +0100
Subject: [Buildroot] [git commit branch/next] harfbuzz: bump to version 1.1.1
Message-ID: <20151125222312.A995581EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08e06ababeb17c79b0fe4927e258e05e14bf223a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash |    4 ++--
 package/harfbuzz/harfbuzz.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 3772242..e15cc17 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.0.tar.bz2.sha256
-sha256	0f584a5947e60ede565e7a4e122baa5e4b17a62eab872abf5f73d8552ceb716b	harfbuzz-1.1.0.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.1.tar.bz2.sha256
+sha256	0c366a77276fa69d40006cf8a2f2dbcd82f3fb406f3960c3c3a0d34dd3a0f06c	harfbuzz-1.1.1.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 703e15c..8251e1f 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.1.0
+HARFBUZZ_VERSION = 1.1.1
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
