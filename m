From: Michael Schenk <michael.schenk@albistechnologies.com>
Date: Mon, 29 Feb 2016 06:46:06 +0100
Subject: [Buildroot] [PATCH 1/1] lirc-tools: add LIRC_TOOLS_INSTALL_STAGING
	= YES to get the library headers into sysroot for develop
	lirc based applications.
Message-ID: <1456724766-22083-1-git-send-email-michael.schenk@albistechnologies.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Schenk <michael.schenk@albistechnologies.com>
---
 package/lirc-tools/lirc-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index fbd8aaf..d366a83 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -10,6 +10,7 @@ LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOL
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-pkgconf
+LIRC_TOOLS_INSTALL_STAGING = YES
 
 LIRC_TOOLS_CONF_OPTS = --without-x
 
-- 
1.9.1
