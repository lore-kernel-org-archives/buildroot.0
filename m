From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:44 -0700
Subject: [Buildroot] [PATCH 17/21] nano: bump to 2.2.5
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-17-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES              |    2 +-
 package/nano/nano.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index b17b716..0b2a6a5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
 	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis, make,
-	module-init-tools, mpfr, openvpn, qt, usbutils
+	module-init-tools, mpfr, nano, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 3e8ba50..e88fda6 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NANO_VERSION = 2.2.3
+NANO_VERSION = 2.2.5
 NANO_SITE = http://www.nano-editor.org/dist/v2.2
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang --enable-tiny
-- 
1.7.2.3
