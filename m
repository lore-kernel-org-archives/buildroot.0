From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 30 May 2018 14:10:48 -0300
Subject: [Buildroot] [PATCH] kexec: bump to version v2.0.17
Message-ID: <20180530171048.25293-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash for "make legal-info".

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/kexec/kexec.hash | 4 +++-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index eaa9d7b96e..24294909ee 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 5b103351ad752c9badd1d65b00eb6de4bce579f944f4df4e3ef3a755ba567010 kexec-tools-2.0.16.tar.xz
+sha256 504c816b769da573167b63f3b6d4fce3740f231c98d8db0c4fda47a4b90482a9 kexec-tools-2.0.17.tar.xz
+# locally calculated
+sha256 fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7 COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 3ce1ed2eac..b0f4367ddd 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.16
+KEXEC_VERSION = 2.0.17
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.14.3
