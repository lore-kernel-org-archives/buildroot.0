From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:55:52 +0200
Subject: [Buildroot] [git commit] package/kexec: bump version to 2.0.20
Message-ID: <20200427194802.B7B6F90916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3a8afb9ab8280fca7181238f20ed221130c425f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kexec version from 2.0.18 to 2.0.20.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index f87692b689..302e079066 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 f020f07341977eb512663e301c2de60c6589e141467c16a8efd58243c0b2b238 kexec-tools-2.0.18.tar.xz
+sha256 dad8077f0315445d1f6335579fc4ade222facf82a67124974c7be5303ba4f8c8 kexec-tools-2.0.20.tar.xz
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
