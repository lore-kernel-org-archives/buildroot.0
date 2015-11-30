From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 13:06:07 +0100
Subject: [Buildroot] [git commit branch/next] harfbuzz: bump to version 1.1.2
Message-ID: <20151130122224.5076D81E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66a1ecb17afa904fee69d34aff03cb922cb9d27e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash |    4 ++--
 package/harfbuzz/harfbuzz.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index e15cc17..0b2bdcb 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.1.tar.bz2.sha256
-sha256	0c366a77276fa69d40006cf8a2f2dbcd82f3fb406f3960c3c3a0d34dd3a0f06c	harfbuzz-1.1.1.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.2.tar.bz2.sha256
+sha256	4a2c5790bd3db7c3ca8c02e4858f2fd592df7932c1d2fa9f6b99acbce0f8461f	harfbuzz-1.1.2.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 8251e1f..be8a899 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.1.1
+HARFBUZZ_VERSION = 1.1.2
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
