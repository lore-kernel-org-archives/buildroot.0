From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 16 Nov 2016 09:52:45 +0900
Subject: [Buildroot] [PATCH v2] boot-wrapper-aarch64: update upstream
	repository
Message-ID: <1479257565-30799-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmarinas/boot-wrapper-aarch64.git does not exist any more.
Switch over to mark/boot-wrapper-aarch64.git.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
---

Changes in v2:
  - Update Config.in as well

 boot/boot-wrapper-aarch64/Config.in               | 2 +-
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index 73d790f..efb70dc 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -11,7 +11,7 @@ config BR2_TARGET_BOOT_WRAPPER_AARCH64
 	  possible to start an Aarch64 kernel inside the available
 	  software simulators for the Aarch64 architecture.
 
-	  git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
+	  git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 
 if BR2_TARGET_BOOT_WRAPPER_AARCH64
 
diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index a469375..601cfab 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOOT_WRAPPER_AARCH64_VERSION = 4266507a84f8c06452109d38e0350d4759740694
-BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
+BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD3c
 BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
 BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux
-- 
2.7.4
