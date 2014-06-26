From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:59 -0300
Subject: [Buildroot] [PATCH 31/53] liblog4c-localtime: add license
	information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-31-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liblog4c-localtime/liblog4c-localtime.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index f2b851d..666cc87 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -5,11 +5,13 @@
 ################################################################################
 
 LIBLOG4C_LOCALTIME_VERSION = v1.0
-LIBLOG4C_LOCALTIME_SITE    = $(call github,rcmadruga,log4c-localtime,$(LIBLOG4C_LOCALTIME_VERSION))
+LIBLOG4C_LOCALTIME_SITE = $(call github,rcmadruga,log4c-localtime,$(LIBLOG4C_LOCALTIME_VERSION))
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 LIBLOG4C_LOCALTIME_CONFIG_SCRIPTS = log4c-config
+LIBLOG4C_LOCALTIME_LICENSE = LGPLv2.1
+LIBLOG4C_LOCALTIME_LICENSE_FILES = COPYING
 
 define LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
 	chmod +x $(@D)/configure
-- 
1.8.5.5
