From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 17:07:39 +0200
Subject: [Buildroot] [git commit] harfbuzz: bump to version 0.9.22
Message-ID: <20131008150944.724FE9B930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30f8f1d2679f65d1d9fa00d8d671fe4b5e7fcc5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
