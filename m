From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 09:59:21 +0100
Subject: [Buildroot] [git commit] package/qemu: add license information
Message-ID: <20121212090207.CE0019A129@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f944824c47ff9c423be2538702c686f279d88051
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QEMU is such a snakes-nest of licenses... :-/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d40d7c9..790d34f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,6 +7,11 @@
 QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
+QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
+QEMU_LICENSE_FILES = COPYING COPYING.LIB
+#??NOTE: there is no top-level license file for non-(L)GPL licenses;
+#       the non-(L)GPL license texts are specified in the affected
+#       individual source files.
 
 QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
 
