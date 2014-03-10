From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:26 -0300
Subject: [Buildroot] [PATCH 06/14] ipsec-tools: bump to version 0.8.2
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also rename patch according to policy and add homepage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipsec-tools/Config.in                                           | 2 ++
 ...psec-tools-susv3-legacy.patch => ipsec-tools-001-susv3-legacy.patch} | 0
 package/ipsec-tools/ipsec-tools.mk                                      | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename package/ipsec-tools/{ipsec-tools-susv3-legacy.patch => ipsec-tools-001-susv3-legacy.patch} (100%)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 06a5a56..57fa5d4 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
+	  http://ipsec-tools.sourceforge.net/
+
 if BR2_PACKAGE_IPSEC_TOOLS
 
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
diff --git a/package/ipsec-tools/ipsec-tools-susv3-legacy.patch b/package/ipsec-tools/ipsec-tools-001-susv3-legacy.patch
similarity index 100%
rename from package/ipsec-tools/ipsec-tools-susv3-legacy.patch
rename to package/ipsec-tools/ipsec-tools-001-susv3-legacy.patch
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 44c3380..870588d 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPSEC_TOOLS_VERSION_MAJOR = 0.8
-IPSEC_TOOLS_VERSION = $(IPSEC_TOOLS_VERSION_MAJOR).0
+IPSEC_TOOLS_VERSION = $(IPSEC_TOOLS_VERSION_MAJOR).2
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/$(IPSEC_TOOLS_VERSION_MAJOR)/
 IPSEC_TOOLS_INSTALL_STAGING = YES
-- 
1.8.3.2
