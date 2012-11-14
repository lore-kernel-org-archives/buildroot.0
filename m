From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:36:06 +0100
Subject: [Buildroot] [git commit] module-init-tools: add license info
Message-ID: <20121114214731.3D9B599B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1f10d0afcbd769a46e85847868a57bab2a429ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/module-init-tools/module-init-tools.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index fe70775..9d136b9 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -7,6 +7,9 @@
 MODULE_INIT_TOOLS_VERSION = 3.15
 MODULE_INIT_TOOLS_SOURCE = module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
 MODULE_INIT_TOOLS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
+MODULE_INIT_TOOLS_LICENSE = GPLv2+
+MODULE_INIT_TOOLS_LICENSE_FILES = COPYING
+
 MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 MODULE_INIT_TOOLS_CONF_OPT = \
 	--disable-static-utils \
