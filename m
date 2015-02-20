From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:33:54 +0100
Subject: [Buildroot] [git commit] kexec: bump to version 2.0.9
Message-ID: <20150302222721.2B731807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0697ab410733a35baba8aef5e839d3ca814aa1ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/kexec.hash |    2 +-
 package/kexec/kexec.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index ac37610..fa2d8be 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	f3abe96fa0793e63936725a4471429f070039a1e81e605deb378747194a50c47	kexec-tools-2.0.8.tar.xz
+sha256	8ae34a9ceb76350954e1e1e3ca9ab51da15862bd5f2fd14392208e60fb454f71	kexec-tools-2.0.9.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index a5df788..d158406 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.8
+KEXEC_VERSION = 2.0.9
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
