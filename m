From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Apr 2014 09:39:33 -0300
Subject: [Buildroot] [PATCH 2/2] libdvdnav: bump to version 4.2.1
In-Reply-To: <1398256773-28764-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398256773-28764-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1398256773-28764-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdnav/libdvdnav.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index befcd8b..78618d3 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 4.1.3
-LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
+LIBDVDNAV_VERSION = 4.2.1
+LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.xz
 LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
+# configure not shipped
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 LIBDVDNAV_CONFIG_SCRIPTS = dvdnav-config
-- 
1.8.3.2
