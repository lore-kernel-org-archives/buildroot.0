From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Mar 2012 22:36:51 +0100
Subject: [Buildroot] [git commit] kmod: bump version
Message-ID: <20120308213705.A658A90D08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de66776330813806aaf2dc6e349044ef71e83f11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index acf5f0a..028d351 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,6 +1,6 @@
-KMOD_VERSION = 5
+KMOD_VERSION = 6
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
-KMOD_SITE = http://packages.profusion.mobi/kmod/
+KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkg-config
 
