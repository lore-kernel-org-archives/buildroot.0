From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 11 Nov 2010 16:16:43 +0200
Subject: [Buildroot] [PATCH] module-init-tools: fix cofigure bug by bumping
	to 3.12
Message-ID: <20101111141642.25734.77865.stgit@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

3.11 fails to configure/compile for my host (F14) due to bug
in ax_enable_builddir.m4

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/module-init-tools/module-init-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 5dfdaad..27d0159 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -3,7 +3,7 @@
 # module-init-tools
 #
 #############################################################
-MODULE_INIT_TOOLS_VERSION=3.11
+MODULE_INIT_TOOLS_VERSION=3.12
 MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
 MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
 MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
