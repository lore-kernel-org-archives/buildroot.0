From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:19:47 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] psmisc: correct license
Message-ID: <20181024121804.4032288943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bbc887846ecd6698e2ea13bf7a8531fee892c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The license heading in source files includes the "or any later"
language.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cfa3447a7829aed59ce673b22212f5c82f83fc61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/psmisc/psmisc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3d9a80462d..6c343a4f2e 100644
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
