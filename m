From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:35 -0700
Subject: [Buildroot] [PATCH 08/21] genext2fs: bump to 1.4.1
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-8-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                        |    4 ++--
 package/genext2fs/genext2fs.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0492e3b..94a86e8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	Toolchain: ARM cortex A9 support
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
-	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, iptables,
-	kismet, openvpn, qt, usbutils
+	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
+	iptables, kismet, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 8c4981e..b4a8e70 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GENEXT2FS_VERSION=1.4
+GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
-- 
1.7.2.3
