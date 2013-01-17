From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Jan 2013 14:43:20 +0100
Subject: [Buildroot] [git commit] libsigc: bump to version 2.2.11
Message-ID: <20130117134636.3726397081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13a81fa2caf32b4fa1a5452f308eed14e127a8f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsigc/libsigc.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 10f5803..3f58686 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -3,10 +3,13 @@
 # libsigc++
 #
 #############################################################
-LIBSIGC_VERSION = 2.2.10
-LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
+
+LIBSIGC_VERSION = 2.2.11
+LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 LIBSIGC_INSTALL_STAGING = YES
+LIBSIGC_LICENSE = LGPLv2.1+
+LIBSIGC_LICENSE_FILES = COPYING
 
 define LIBSIGC_INSTALL_TARGET_FIXUP
 	rm -rf $(TARGET_DIR)/usr/share/devhelp/books/libsigc++*
