From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 18:57:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/nasm: bump version to 2.15.05
Message-ID: <20200920165758.2032916-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/19e/19ee2bdd4c8d14cc1554092594b3721117ca1005/
http://autobuild.buildroot.net/results/72e/72e4089dafacd245e781214b72baeb81a1e3d3d7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index 7d04add9dc..86c67d6ba5 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b0891d23aa083546e7845dfaa0a9109a03f1f57ad0740e7acd07f80df57876d8  nasm-2.15.04.tar.xz
+sha256  3caf6729c1073bf96629b57cee31eeb54f4f8129b01902c73428836550b30a3f  nasm-2.15.05.tar.xz
 sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 63ff52a4af..b44b97e62b 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.15.04
+NASM_VERSION = 2.15.05
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
-- 
2.27.0
