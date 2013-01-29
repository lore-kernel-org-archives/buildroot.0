From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:52 -0300
Subject: [Buildroot] [PATCH 03/10] distcc: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/distcc/distcc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 1e09f57..006c0aa 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -3,11 +3,13 @@
 # distcc
 #
 #############################################################
+
 DISTCC_VERSION = 2.18.3
 DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
 DISTCC_SITE = http://distcc.googlecode.com/files/
-
 DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
+DISTCC_LICENSE = GPLv2+
+DISTCC_LICENSE_FILES = COPYING
 
 define DISTCC_INSTALL_TARGET_CMDS
 	install -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
-- 
1.7.12.4
