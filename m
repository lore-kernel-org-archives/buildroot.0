From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Apr 2014 09:39:32 -0300
Subject: [Buildroot] [PATCH 1/2] libdvdread: bump to version 4.2.1
Message-ID: <1398256773-28764-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop redundant LIBTOOL_PATCH = YES

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdread/libdvdread.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 35d7548..6658460 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 4.1.3
-LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
+LIBDVDREAD_VERSION = 4.2.1
+LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
 LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
+# configure not shipped
 LIBDVDREAD_AUTORECONF = YES
-LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_CONFIG_SCRIPTS = dvdread-config
 LIBDVDREAD_LICENSE = GPLv2+
-- 
1.8.3.2
