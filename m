From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 12:25:39 +0100
Subject: [Buildroot] [git commit] zyre: bump git snapshot
Message-ID: <20131216113554.CC6C79C0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abe6a13ceaed147449220ee671dc8574f4e7068c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 3e28212..405697a 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 44a57a449a34bb6310b5ce4b17f1ce42f9b17beb
-ZYRE_SITE = git://github.com/zeromq/zyre.git
+ZYRE_VERSION = 378b8b5cf76d10f5e41b339a4bcb0dc6197a9edf
+ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
