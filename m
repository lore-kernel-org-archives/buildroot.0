From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 11:13:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/ipsec-tools: fix broken download URL
Message-ID: <1454148798-28228-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ipsec-tools/ipsec-tools.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 9454c4e..98216ea 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-IPSEC_TOOLS_VERSION_MAJOR = 0.8
-IPSEC_TOOLS_VERSION = $(IPSEC_TOOLS_VERSION_MAJOR).2
+IPSEC_TOOLS_VERSION = 0.8.2
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/$(IPSEC_TOOLS_VERSION_MAJOR)
+IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
-- 
2.7.0.rc3
