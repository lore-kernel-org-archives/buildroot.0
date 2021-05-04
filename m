From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 21:19:57 +0200
Subject: [Buildroot] [git commit] package/kexec: bump to version 2.0.22
Message-ID: <20210504185242.1560A8817A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cadb8f2f317bf37c13aea98ac1c81bf8566aad92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.spinics.net/lists/kexec/msg26864.html

Signed-off-by: Federico Pellegrin <fede@evolware.org>
[yann.morin.1998 at free.fr: two-spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kexec/kexec.hash | 4 ++--
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index e8eb932a65..1cf860d85e 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 e113142dee891638ad96e0f72cf9277b244477619470b30c41999d312e8e8702 kexec-tools-2.0.21.tar.xz
+sha256  96c97f49ed86049f8b72722cb53e7fe3693e5a4f31e78a3a6249e3d18dac49c2  kexec-tools-2.0.22.tar.xz
 # locally calculated
-sha256 fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7 COPYING
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 280fe42d30..13b852c8ed 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.21
+KEXEC_VERSION = 2.0.22
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
