From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Nov 2012 09:01:02 +0100
Subject: [Buildroot] [git commit] qemu: needs zlib
Message-ID: <20121105081345.1A20999BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21df600169d19385d99233160326d5b40db7f0ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build error message is:
  Error: zlib check failed
  Make sure to have the zlib libs and headers installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c2c4103..67d5ab2 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@ QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 
-QEMU_DEPENDENCIES = host-pkgconf
+QEMU_DEPENDENCIES = host-pkgconf zlib
 
 #       BR ARCH         qemu
 #       -------         ----
