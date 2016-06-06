From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jun 2016 09:30:42 +0200
Subject: [Buildroot] [git commit] package/zyre: update license
Message-ID: <20160606074803.40C4381E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27652be12483a2bacc83e31bf00eb46d4d7fef6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project switched to MPLv2.0:
https://github.com/zeromq/zyre/issues/327

Fixes
http://autobuild.buildroot.net/results/88f/88fa0b150ad83e42625666cbffdf95ee178015cb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 41c11a8..8647456 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -6,8 +6,8 @@
 
 ZYRE_VERSION = 1d949e4bf79b694ea883c325f5813e87ddc2a687
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
-ZYRE_LICENSE = LGPLv3+
-ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
+ZYRE_LICENSE = MPLv2.0
+ZYRE_LICENSE_FILES = LICENSE
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = czmq zeromq host-pkgconf
 ZYRE_AUTORECONF = YES
