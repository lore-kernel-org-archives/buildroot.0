From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:21:41 +0200
Subject: [Buildroot] [git commit] uclibc: use tabs instead of spaces for
	indentation
Message-ID: <20170408142159.9347B82548@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be458128dff83ce0930ed10fe40334cb5fe14690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Detected by check-package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 44c23a7..45bb6de 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -54,34 +54,34 @@ endif
 # noMMU binary formats
 ifeq ($(BR2_BINFMT_FDPIC),y)
 define UCLIBC_BINFMT_CONFIG
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
 endef
 endif
 ifeq ($(BR2_BINFMT_FLAT_ONE),y)
 define UCLIBC_BINFMT_CONFIG
-       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
 endef
 endif
 ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
 define UCLIBC_BINFMT_CONFIG
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
 endef
 endif
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
 define UCLIBC_BINFMT_CONFIG
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
 endef
 endif
 
