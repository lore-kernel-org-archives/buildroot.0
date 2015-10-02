From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 16:32:12 +0200
Subject: [Buildroot] [git commit] harfbuzz: bump to version 1.0.4
Message-ID: <20151002143558.5FE5B81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f1f0d6da1950a0a7b2f2777fd1932bc43f935ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash |    4 ++--
 package/harfbuzz/harfbuzz.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 2d80b60..a1302fe 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.3.tar.bz2.sha256
-sha256	ebdc875ea06d010722dec13d92bc40002ab6a77071d62e71aad564ff76a63df7	harfbuzz-1.0.3.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.4.tar.bz2.sha256
+sha256	b030373457e7c00d3a7920f15e6fcd35defac3c4e44cd14ed85869030df74381	harfbuzz-1.0.4.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 60dcd94..b4116c6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.0.3
+HARFBUZZ_VERSION = 1.0.4
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
