From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 20 Nov 2011 21:51:17 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: update to 1.13.2
Message-ID: <1321822277-30212-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

crosstool-NG 1.13.2 contains an important fix related to building
the ncurses libraries: the latest ncurses version requires tic to
be either in ${TIC_PATH}, or to be exactly /usr/bin/tic.

Also contains a few minor fixes:
 - CLooG extraction
 - prescott is a i686

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 82c1fbe..0337bf1 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.13.1
+CROSSTOOL_NG_VERSION           = 1.13.2
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
-- 
1.7.2.5
