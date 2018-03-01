From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Mar 2018 21:09:53 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/nasm: bump version to 2.13.03
Message-ID: <20180301200953.18312-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index 260e5d7bc4..db5b857193 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8ac3235f49a6838ff7a8d7ef7c19a4430d0deecc0c2d3e3e237b5e9f53291757  nasm-2.13.02.tar.xz
+sha256 812ecfb0dcbc5bd409aaa8f61c7de94c5b8752a7b00c632883d15b2ed6452573  nasm-2.13.03.tar.xz
 sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index ee3fd9c542..76bcca3bbf 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.13.02
+NASM_VERSION = 2.13.03
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
-- 
2.11.0
