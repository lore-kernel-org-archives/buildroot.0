From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 10 Mar 2017 16:16:53 +0100
Subject: [Buildroot] [PATCH] package/elfutils: fixes download site due to
	recent fedorahosted.org closing
Message-ID: <1489159013-11420-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/elfutils/Config.in   | 2 +-
 package/elfutils/elfutils.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 0419e27..7db8472 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_ELFUTILS
 	  Note that this option only installs the libraries, and not
 	  the programs.
 
-	  https://fedorahosted.org/elfutils
+	  https://sourceware.org/elfutils/
 
 if BR2_PACKAGE_ELFUTILS
 
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 566e0bf..0bf105e 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -6,7 +6,7 @@
 
 ELFUTILS_VERSION = 0.166
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
-ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
+ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPLv2+ or LGPLv3+ (library)
 ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
-- 
2.1.4
