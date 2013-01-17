From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jan 2013 09:25:42 -0300
Subject: [Buildroot] [PATCH 3/4] libsigc: bump to version 2.2.11
In-Reply-To: <1358425543-25435-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358425543-25435-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358425543-25435-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigc/libsigc.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

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
-- 
1.7.12.4
