From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Oct 2013 08:35:40 +0200
Subject: [Buildroot] [PATCH 1/1] harfbuzz: bump to version 0.9.22
Message-ID: <1381214140-25499-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/harfbuzz/harfbuzz.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 00651fd..847075d 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 0.9.19
+HARFBUZZ_VERSION = 0.9.22
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library), ICU License (icu support library)
-- 
1.7.9.5
