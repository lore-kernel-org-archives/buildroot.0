From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:42 -0700
Subject: [Buildroot] [PATCH 15/21] module-init-tools: bump to 3.12
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-15-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                        |    2 +-
 package/module-init-tools/module-init-tools.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index aaffd26..9c89f65 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
 	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis, make,
-	openvpn, qt, usbutils
+	module-init-tools, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
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
-- 
1.7.2.3
