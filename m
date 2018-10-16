From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 16 Oct 2018 19:07:13 +0300
Subject: [Buildroot] [PATCH 1/2] psmisc: correct license
Message-ID: <c9b0eba7a84ac3590dfb9d311c2b4f39faede9e2.1539706034.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license heading in source files includes the "or any later"
language.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/psmisc/psmisc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3916e34b089c..ee441f582dfd 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -7,7 +7,7 @@
 PSMISC_VERSION = 23.1
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
-PSMISC_LICENSE = GPL-2.0
+PSMISC_LICENSE = GPL-2.0+
 PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 # Patching Makefile.am
-- 
2.19.1
