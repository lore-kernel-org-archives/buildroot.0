From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jul 2014 16:27:30 +0200
Subject: [Buildroot] [git commit] zyre: bump version to v1.0.0
Message-ID: <20140703143459.01D339D150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1f8d4d0729b162a3491303c879c3e9dcdfcfdfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 66952aa..013299e 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 378b8b5cf76d10f5e41b339a4bcb0dc6197a9edf
+ZYRE_VERSION = v1.0.0
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
