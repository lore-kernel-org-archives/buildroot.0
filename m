From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Oct 2015 13:31:56 +0300
Subject: [Buildroot] [PATCH] ltp-testsuite: update homepage link and
	download site
Message-ID: <f1b5c3f899c70e4f61f9ded871ec3f1d2e357512.1445337116.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltp-testsuite migrated to github.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ltp-testsuite/Config.in        | 2 +-
 package/ltp-testsuite/ltp-testsuite.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 978b8e3cbae1..bd540f29f86b 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and UCLIBC_SV4_DEPRECATED
 	  are needed.
 
-	  http://ltp.sourceforge.net/
+	  http://linux-test-project.github.io
 
 comment "ltp-testsuite needs a non-musl toolchain w/ threads"
 	depends on !BR2_nios2
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7fe42eb82ff9..64467de69737 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -6,7 +6,7 @@
 
 LTP_TESTSUITE_VERSION = 20150420
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
-LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
+LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 LTP_TESTSUITE_CONF_OPTS += \
-- 
2.6.1
