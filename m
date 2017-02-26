From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:42:55 +0100
Subject: [Buildroot] [git commit branch/next] kmod: bump to version 24
Message-ID: <20170226204326.932E180296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63565627884d2e69488688438203aece13b0786b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 8220fd4..be350c4 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256 d303d5519faec9d69e1132f6b37db2579db17a7fb5c1517da0115d03ba168155  kmod-23.tar.xz
+sha256 610b8d1df172acc39a4fdf1eaa47a57b04873c82f32152e7a62e29b6ff9cb397  kmod-24.tar.xz
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7492b92..61cc0b8 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 23
+KMOD_VERSION = 24
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
