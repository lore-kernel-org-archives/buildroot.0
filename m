From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 20:13:18 +0100
Subject: [Buildroot] [git commit] package/qemu: bump version to 1.2.2
Message-ID: <20121216200125.54BF49A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a35555b33108e480ce7dae852d25e7eb634ad09a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are a bunch of important fixes since 1.2.1.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 8d07807..315886f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QEMU_VERSION = 1.2.1
+QEMU_VERSION = 1.2.2
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
