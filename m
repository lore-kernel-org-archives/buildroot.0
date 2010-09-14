From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:38 -0700
Subject: [Buildroot] [PATCH 11/21] libelf: bump to 0.8.13
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-11-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                  |    2 +-
 package/libelf/libelf.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index e2fa369..e541b7e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
-	gmp, iptables, kismet, libdeamon, openvpn, qt, usbutils
+	gmp, iptables, kismet, libdeamon, libelf, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 2a7d066..eb1a1ad 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -3,7 +3,7 @@
 # libelf
 #
 #############################################################
-LIBELF_VERSION=0.8.12
+LIBELF_VERSION=0.8.13
 LIBELF_SOURCE=libelf-$(LIBELF_VERSION).tar.gz
 LIBELF_SITE=http://www.mr511.de/software/
 LIBELF_INSTALL_STAGING = YES
-- 
1.7.2.3
