From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Nov 2019 19:02:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/lzma: add license
Message-ID: <20191124180239.32194-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lzma/lzma.hash | 3 +++
 package/lzma/lzma.mk   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/lzma/lzma.hash b/package/lzma/lzma.hash
index e73517ca57..6055d7d986 100644
--- a/package/lzma/lzma.hash
+++ b/package/lzma/lzma.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256	02aa57f995d15b7acb7c2496d88a39fb0124ea00bf027cc61dd24eddb5942dff	lzma-4.32.7.tar.xz
+sha256	231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c	COPYING.GPLv2
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING.GPLv3
+sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	COPYING.LGPLv2.1
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 1b4d7febb1..55ad1ae841 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -7,6 +7,8 @@
 LZMA_VERSION = 4.32.7
 LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
 LZMA_SITE = http://tukaani.org/lzma
+LZMA_LICENSE = GPL-2.0+, LGPL-2.1+, GPL-3.0+ (tests)
+LZMA_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 $(eval $(host-autotools-package))
 
-- 
2.24.0
