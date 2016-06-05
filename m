From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:15:35 +0200
Subject: [Buildroot] [git commit] cryptsetup: bump to version 1.7.2
Message-ID: <20160605201808.A9BB4818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e1abc0bcd9852b30983cf94880aab7a0022361e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 0928627..5972bf8 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
-sha256	73dc8a63cc984b56aa6a3c99f355262471bcfe78b3240b8b9d0caa8002911fec	cryptsetup-1.7.1.tar.xz
+sha256	dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342	cryptsetup-1.7.2.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 4d37709..d7bd251 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
