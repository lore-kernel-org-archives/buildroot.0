From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Sep 2015 23:48:39 +0200
Subject: [Buildroot] [git commit] harfbuzz: bump to version 1.0.3
Message-ID: <20150907221137.F2EE581E94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f81dc860a504987d94e196817934f1905780704d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash |    4 ++--
 package/harfbuzz/harfbuzz.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a054d6e..2d80b60 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.2.tar.bz2.sha256
-sha256	beb3caf8654010fcdca61c810a3a7532237fc567ee4271deb674b5efbbe3b466	harfbuzz-1.0.2.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.3.tar.bz2.sha256
+sha256	ebdc875ea06d010722dec13d92bc40002ab6a77071d62e71aad564ff76a63df7	harfbuzz-1.0.3.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3fa9642..60dcd94 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.0.2
+HARFBUZZ_VERSION = 1.0.3
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
