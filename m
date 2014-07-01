From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:43:01 +0200
Subject: [Buildroot] [git commit] liblog4c-localtime: add license information
Message-ID: <20140701224922.037F39D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=516c174ee18af5eeb3b4929e4c9564726461bec6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblog4c-localtime/liblog4c-localtime.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
