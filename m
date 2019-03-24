From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Mar 2019 21:14:38 +0100
Subject: [Buildroot] [PATCH 08/12] package/x11r7/xlib_libXvMC: bump version
 to 1.0.11
In-Reply-To: <20190324201443.21347-1-bernd.kuhls@t-online.de>
References: <20190324201443.21347-1-bernd.kuhls@t-online.de>
Message-ID: <20190324201443.21347-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 9 +++++++--
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index 380c811989..ac8457870c 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002728.html
-sha256 e501a079b5dfaef0897c56152770c77e05e362065cec58910289aa567277ee2e  libXvMC-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002981.html
+md5 707175185a2e0490b8173686c657324f  libXvMC-1.0.11.tar.bz2
+sha1 9dbcb89c8adc7709b8a70ea0cde168f69d06859f  libXvMC-1.0.11.tar.bz2
+sha256 4a2e34d444a683a7c010b01b23cefe2b8043a063ce4dc6a9b855836b5262622d  libXvMC-1.0.11.tar.bz2
+sha512 4fe49e956ac97a45d851292cbba7bf242706aaf3bd9eb7ea4d2fc50e40745115d857a4fe179d2b87bc7cb6f9ac93911e89a167f02f6d1ae25a59df9a517a2476  libXvMC-1.0.11.tar.bz2
+# Locally computed
+sha256 b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index c970182fe5..713abc7448 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.10
+XLIB_LIBXVMC_VERSION = 1.0.11
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
-- 
2.20.1
