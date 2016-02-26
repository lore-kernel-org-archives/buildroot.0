From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 19:41:35 +0100
Subject: [Buildroot] [git commit branch/next] linux-backports: bump to
	version 4.4.2-1
Message-ID: <20160226184640.2F4D5819BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50c0e231a785ce3a123f4057e03683e0eb7491ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-backports/linux-backports.hash | 4 ++--
 package/linux-backports/linux-backports.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index 0d41067..38f39b9 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,2 +1,2 @@
-# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.1.1/sha256sums.asc
-sha256 7fca160665b801796ce50def18f2fd6def1c4452290e93ec5332444fb2021bd6  backports-4.1.1-1.tar.xz
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.4.2/sha256sums.asc
+sha256 a979e194c2ed9fdfca092a448e626d85c5af0e4de5ad993c0967afd15af01285  backports-4.4.2-1.tar.xz
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 44ac7e7..58cd50f 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_BACKPORTS_VERSION_MAJOR = 4.1.1
+LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
