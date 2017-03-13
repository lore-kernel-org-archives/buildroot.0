From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 11:26:41 +0000
Subject: [Buildroot] [PATCH] harfbuzz: bump version to 1.4.5
Message-ID: <20170313112641.24161-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index b7da64b..f4fb849 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.4.tar.bz2.sha256
-sha256	35d2f8ca476cbbec64ee824eca6b0209ff8db0334990b9f5af893b94f119d255	harfbuzz-1.4.4.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.5.tar.bz2.sha256
+sha256 d0e05438165884f21658154c709075feaf98c93ee5c694b951533ac425a9a711  harfbuzz-1.4.5.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 6464480..39e2cfe 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.4
+HARFBUZZ_VERSION = 1.4.5
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.10.2
