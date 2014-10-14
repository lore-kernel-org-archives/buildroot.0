From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 10:44:30 -0300
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.8
Message-ID: <1413294270-31126-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kexec/kexec.hash | 2 ++
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/kexec/kexec.hash

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
new file mode 100644
index 0000000..ac37610
--- /dev/null
+++ b/package/kexec/kexec.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
+sha256	f3abe96fa0793e63936725a4471429f070039a1e81e605deb378747194a50c47	kexec-tools-2.0.8.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 83a3a09..a5df788 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.7
+KEXEC_VERSION = 2.0.8
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
-- 
2.0.4
