From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:44:57 +0200
Subject: [Buildroot] [git commit] package/ipcalc: use gitlab macro
Message-ID: <20210328202028.87D2E7FB91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e2b61b266e4566f127ff7868ce51c7353c2e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
