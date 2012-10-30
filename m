From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Oct 2012 22:22:16 +0100
Subject: [Buildroot] [git commit] xz: bump to 5.0.4
Message-ID: <20121030213118.097E099975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02eec22ed29427103444a521eeca7110e50a75d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xz/xz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e700c0d..e00c91b 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,7 +3,7 @@
 # xz-utils
 #
 #############################################################
-XZ_VERSION = 5.0.3
+XZ_VERSION = 5.0.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
