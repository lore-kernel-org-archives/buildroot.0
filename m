From: Geoff Levand <geoff@infradead.org>
Date: Mon, 27 Apr 2020 16:09:32 +0000
Subject: [Buildroot] [PATCH v1 1/2] package/kexec: bump version to 2.0.20
In-Reply-To: <cover.1588003514.git.geoff@infradead.org>
References: <cover.1588003514.git.geoff@infradead.org>
Message-ID: <d54561126b007de1fb1c2b1f2e4cb77f347f8209.1588003514.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kexec version from 2.0.18 to 2.0.20.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index f87692b689..16b2e1aa4d 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 f020f07341977eb512663e301c2de60c6589e141467c16a8efd58243c0b2b238 kexec-tools-2.0.18.tar.xz
+sha256 dad8077f0315445d1f6335579fc4ade222facf82a67124974c7be5303ba4f8c8  kexec-tools-2.0.20.tar.xz
 # locally calculated
 sha256 fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7 COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index b011c0b4e5..63fcc074b5 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.18
+KEXEC_VERSION = 2.0.20
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.20.1
