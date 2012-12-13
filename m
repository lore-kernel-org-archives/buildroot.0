From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 00:53:49 +0100
Subject: [Buildroot] [git commit] package/qemu: bump version
Message-ID: <20121213235340.62DAB9A1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c51f1d88518fdb7f68438a1144d8f30fe210355e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump QEMU to 1.2.1.

Note: 1.3.0 is out now, but ./configure has changed a bit, and there are
new dependencies, so the bump to 1.3.0 is postponed for a litle while...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2c0dbde..3c01102 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QEMU_VERSION = 1.2.0
+QEMU_VERSION = 1.2.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
