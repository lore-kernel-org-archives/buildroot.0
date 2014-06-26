From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:29 -0300
Subject: [Buildroot] [PATCH 01/53] blackbox: add license information
Message-ID: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/blackbox/blackbox.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index ce8f06e..b7b9726 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,11 +7,11 @@
 BLACKBOX_VERSION = 0.70.1
 BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE = http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
-
 BLACKBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
-
 BLACKBOX_DEPENDENCIES = xlib_libX11
+BLACKBOX_LICENSE = MIT
+BLACKBOX_LICENSE_FILES = LICENSE
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
-- 
1.8.5.5
