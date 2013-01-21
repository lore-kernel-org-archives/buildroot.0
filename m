From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:40:14 +0100
Subject: [Buildroot] [git commit] xz: add license information
Message-ID: <20130121225446.E4D029A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c078e9222c30c59ebd650ef1bcff81edaeca14c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xz/xz.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e00c91b..8ff3c83 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,11 +3,14 @@
 # xz-utils
 #
 #############################################################
+
 XZ_VERSION = 5.0.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
+XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
