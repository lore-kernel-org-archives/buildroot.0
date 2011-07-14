From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 09:35:52 +0200
Subject: [Buildroot] [git commit] xz: bump version
Message-ID: <20110714075410.D46058A5B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=749213ffdf921f88d74cd7d587854dfe46b0405e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xz/xz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 1d8c7ee..ed4734b 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,7 +3,7 @@
 # xz-utils
 #
 #############################################################
-XZ_VERSION = 5.0.1
+XZ_VERSION = 5.0.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
-- 
1.7.3.4
