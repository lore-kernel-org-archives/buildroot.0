From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 11:21:14 +0200
Subject: [Buildroot] [git commit] kexec: bump to 2.0.13
Message-ID: <20161019093219.B1EAD7FB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26a37a26e16a2fa6d3d0d7ceb097d42e2342841c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 24a71e7..90a7ce9 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	b1097986ffdb928cf41a94e8a5dfddc981a8fa710cccf13298e7f8dd939a2ee3	kexec-tools-2.0.11.tar.xz
+sha256	874baf421171dbfca0084af2da71ccf5a67749dd2a27c3023da5f72460bae5cc kexec-tools-2.0.13.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 0e64c0d..4ca55e5 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.11
+KEXEC_VERSION = 2.0.13
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
