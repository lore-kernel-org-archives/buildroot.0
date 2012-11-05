From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Nov 2012 09:01:06 +0100
Subject: [Buildroot] [git commit] qemu: needs libglib2
Message-ID: <20121105081345.54E9199BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f55cad368981f5dbeab98e225ed770b57417a709
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build error message is:
  glib-2.12 required to compile QEMU

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 67d5ab2..d40d7c9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@ QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 
-QEMU_DEPENDENCIES = host-pkgconf zlib
+QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
 
 #       BR ARCH         qemu
 #       -------         ----
