From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:41 -0700
Subject: [Buildroot] [PATCH 14/21] make: bump to 3.82
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-14-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES              |    2 +-
 package/make/make.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3412924..aaffd26 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
-	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis,
+	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis, make,
 	openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
diff --git a/package/make/make.mk b/package/make/make.mk
index 12d236a..6beccf3 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -3,7 +3,7 @@
 # make
 #
 #############################################################
-MAKE_VERSION:=3.81
+MAKE_VERSION:=3.82
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-- 
1.7.2.3
