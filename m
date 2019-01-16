From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 16 Jan 2019 22:15:10 +0100
Subject: [Buildroot] [PATCH] package/wavemon: bump to version 0.9.0
Message-ID: <20190116211510.32049-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wavemon/wavemon.hash | 2 +-
 package/wavemon/wavemon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 99d7382450..798e2973ce 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4199e2ad11a036f4289f5ad42a8b0fe518f2b5ff77447f4c366dbcf3f23e91d5  wavemon-v0.8.2.tar.gz
+sha256  5823ef9459d6147a457b390b6744a77465584e93d37c2809fa7a0be557070166  wavemon-v0.9.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 0639c3450e..864e0709d1 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = v0.8.2
+WAVEMON_VERSION = v0.9.0
 WAVEMON_SITE = $(call github,uoaerg,wavemon,$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = COPYING
-- 
2.20.1
