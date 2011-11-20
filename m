From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Nov 2011 21:54:45 +0100
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: update to 1.13.2
Message-ID: <20111120205508.2AC358F62A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32bea4a1cf9968a4e46a6ecd7fd878e6f0159511
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crosstool-NG 1.13.2 contains an important fix related to building
the ncurses libraries: the latest ncurses version requires tic to
be either in ${TIC_PATH}, or to be exactly /usr/bin/tic.

Also contains a few minor fixes:
 - CLooG extraction
 - prescott is a i686

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
