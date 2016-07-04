From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 11:29:31 +0200
Subject: [Buildroot] [git commit] qemu: bump to version 2.6.0
Message-ID: <20160704092942.9AAA9816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a31b1a9df11399e3b26c66310fa61d144dc1f77e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index d35960a..2d6d96c 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 28d9946e43765a44ccccca3cba5f4f9034f2759ec1f2ce16594ddb6776c8efe6  qemu-2.5.1.1.tar.bz2
+sha256 c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec  qemu-2.6.0.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3ca0958..5ca0e77 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.5.1.1
+QEMU_VERSION = 2.6.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
