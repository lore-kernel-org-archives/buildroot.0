From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:48:04 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/ipcalc: use
 gitlab macro
Message-ID: <20210403072612.AE33580298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc0ec9988c350c0ed85b14d3532739ea2da951ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d4e2b61b266e4566f127ff7868ce51c7353c2e49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipcalc/ipcalc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index c4ce8b9ceb..ff9d643389 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPCALC_VERSION = 1.0.0
-IPCALC_SITE = https://gitlab.com/ipcalc/ipcalc/-/archive/$(IPCALC_VERSION)
+IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
