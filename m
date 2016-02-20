From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 23:04:19 +0100
Subject: [Buildroot] [git commit] package/kexec: bump version to 2.0.11
Message-ID: <20160302202755.3A8067FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff370f7a69b17a7dbe9b9d8dcc530c2a8ab3da18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index fa2d8be..24a71e7 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	8ae34a9ceb76350954e1e1e3ca9ab51da15862bd5f2fd14392208e60fb454f71	kexec-tools-2.0.9.tar.xz
+sha256	b1097986ffdb928cf41a94e8a5dfddc981a8fa710cccf13298e7f8dd939a2ee3	kexec-tools-2.0.11.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index d158406..d27c514 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.9
+KEXEC_VERSION = 2.0.11
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
