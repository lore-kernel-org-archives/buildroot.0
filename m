From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 25 Aug 2020 20:12:14 -0300
Subject: [Buildroot] [PATCH] package/nasm: bump version to 2.15.04
Message-ID: <20200825231214.13855-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/nasm/nasm.hash | 4 ++--
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index d824f22b863f..7d04add9dcdf 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e24ade3e928f7253aa8c14aa44726d1edf3f98643f87c9d72ec1df44b26be8f5  nasm-2.14.02.tar.xz
-sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
+sha256  b0891d23aa083546e7845dfaa0a9109a03f1f57ad0740e7acd07f80df57876d8  nasm-2.15.04.tar.xz
+sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 5a46fd0a4b62..63ff52a4af3d 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.14.02
+NASM_VERSION = 2.15.04
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
-- 
2.17.1
