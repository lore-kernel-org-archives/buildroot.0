From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Mar 2013 12:06:59 -0300
Subject: [Buildroot] [PATCH] libsigc: needs host-m4
Message-ID: <1364396819-1340-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e0e5ec38208ac6cc163b6ca882690de177cb8c51/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigc/libsigc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 3f58686..c0a0835 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -7,6 +7,7 @@
 LIBSIGC_VERSION = 2.2.11
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC_DEPENDENCIES = host-m4
 LIBSIGC_INSTALL_STAGING = YES
 LIBSIGC_LICENSE = LGPLv2.1+
 LIBSIGC_LICENSE_FILES = COPYING
-- 
1.8.1.5
