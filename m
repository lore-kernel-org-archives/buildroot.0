From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:02:33 +0100
Subject: [Buildroot] [git commit] ipsec-tools: bump to version 0.8.2
Message-ID: <20140311220647.87A759BEFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1083adfc42377bff3629b08cbf1fbded46b4767
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also rename patch according to policy and add homepage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/Config.in                      |    2 ++
 ...cy.patch => ipsec-tools-001-susv3-legacy.patch} |    0
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 3 files changed, 3 insertions(+), 1 deletions(-)

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
