From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon,  2 Mar 2020 14:02:50 +0000
Subject: [Buildroot] [PATCH 1/1] boot/opensbi: bump to version 0.6
Message-ID: <20200302140250.12734-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with qemu_riscv32_virt_defconfig and
qemu_riscv64_virt_defconfig using Buildroot host-qemu 4.2.0.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 boot/opensbi/opensbi.hash | 2 +-
 boot/opensbi/opensbi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 47d5930ace..6e69d512dd 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 bc82f1e63663cafb7976b324d8a01263510cfd816063dc89e0ccffb9763fb1dd opensbi-0.5.tar.gz
+sha256 46a93afd5465eba094ddba40015e754bf09f9e80e0702c00013d6bdb3ecd0a72 opensbi-0.6.tar.gz
 sha256 82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21 COPYING.BSD
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 2df746ab00..00e3b05dd0 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSBI_VERSION = 0.5
+OPENSBI_VERSION = 0.6
 OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
 OPENSBI_LICENSE = BSD-2-Clause
 OPENSBI_LICENSE_FILES = COPYING.BSD
-- 
2.20.1
