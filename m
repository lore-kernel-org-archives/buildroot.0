From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Mar 2016 09:44:45 -0300
Subject: [Buildroot] [PATCH] lirc-tools: needs host-python3
Message-ID: <1458391485-23315-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in NEWS "Build scripts now requires python3". Fixes:
http://autobuild.buildroot.net/results/f41/f417a17ad24eec8f72402a634588c6b3af8293be/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lirc-tools/lirc-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 2e437a6..46886a9 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -9,7 +9,7 @@ LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
-LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf
+LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
-- 
2.4.10
