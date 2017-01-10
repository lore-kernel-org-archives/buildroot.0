From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 14:02:36 +0100
Subject: [Buildroot] [git commit] kexec-lite: add KEXEC_LITE_LICENSE_FILES
Message-ID: <20170110130345.1B58F806A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d67d5023dd49a9e49c3aa1dd9590312cdfe42a45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec-lite/kexec-lite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 2467306..b1b66fd 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -7,6 +7,7 @@
 KEXEC_LITE_VERSION = 86e45a47e8cc1f598ccfa9b873a23067f4ecc36f
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPLv2+
+KEXEC_LITE_LICENSE_FILES = COPYING
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
 
 define KEXEC_LITE_BUILD_CMDS
