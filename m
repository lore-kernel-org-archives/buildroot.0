From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:34 +0200
Subject: [Buildroot] [PATCH 12/16] liblog4c-localtime: remove whitespace at
	beginning of lines
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblog4c-localtime/liblog4c-localtime.mk |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 3b1642c..492c6ef 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -1,13 +1,13 @@
- #############################################################
- #
- # liblog4c
- #
- #############################################################
- LIBLOG4C_LOCALTIME_VERSION = 1.0
- LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
- LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
- LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
- LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
+#############################################################
+#
+# liblog4c
+#
+#############################################################
+LIBLOG4C_LOCALTIME_VERSION = 1.0
+LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
+LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
+LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
+LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 
 define LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
 	chmod +x $(@D)/configure
-- 
1.7.9.5
