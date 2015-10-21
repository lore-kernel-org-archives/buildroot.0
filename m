From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:15:36 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: update homepage link and
	download site
Message-ID: <20151021201836.8E4AF81EE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae33f027b55850cd8f48dedfb79402688662173f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltp-testsuite migrated to github.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in        |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 91b09ce..8475902 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and UCLIBC_SV4_DEPRECATED
 	  are needed.
 
-	  http://ltp.sourceforge.net/
+	  http://linux-test-project.github.io
 
 comment "ltp-testsuite needs a non-musl toolchain w/ threads"
 	depends on !BR2_nios2
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7fe42eb..64467de 100644
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
