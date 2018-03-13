From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Mar 2018 22:05:21 +0100
Subject: [Buildroot] [PATCH 16/22] package/x11r7/xapp_xsetroot: bump version
 to 1.1.2
In-Reply-To: <20180313210527.309-1-bernd.kuhls@t-online.de>
References: <20180313210527.309-1-bernd.kuhls@t-online.de>
Message-ID: <20180313210527.309-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xsetroot/xapp_xsetroot.hash | 9 +++++++--
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
index 89a1abe454..7cbabb5cef 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002149.html
-sha256	ba215daaa78c415fce11b9e58c365d03bb602eaa5ea916578d76861a468cc3d9	xsetroot-1.1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002874.html
+md5 5fe769c8777a6e873ed1305e4ce2c353  xsetroot-1.1.2.tar.bz2
+sha1 42ab81761823b44974feab86477007c49dbace50  xsetroot-1.1.2.tar.bz2
+sha256 10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c  xsetroot-1.1.2.tar.bz2
+sha512 0b9df1b72305e5c24f1e1664578aa4411a5ffcdc5d318458117594e641f01c34700205b0d16c08abf4a8106d36128ccdbe1ea1f1035fce9018d6b52801a8b72b  xsetroot-1.1.2.tar.bz2
+# Locally computed
+sha256 48e9c9572e0dc1c14b93b753542f780e7751dd7f035816374d8a8be0211a4520 COPYING
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 9000867c84..98ba344cfa 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSETROOT_VERSION = 1.1.1
+XAPP_XSETROOT_VERSION = 1.1.2
 XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETROOT_LICENSE = MIT
-- 
2.11.0
