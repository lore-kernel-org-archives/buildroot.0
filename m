From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 22:43:23 +0100
Subject: [Buildroot] [git commit] qwt: bump version
Message-ID: <20130113214509.2A93899AFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=766862434b728c3d647b5544844d305edd5f541a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qwt/qwt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 1560ea4..e35833d 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QWT_VERSION = 6.0.1
+QWT_VERSION = 6.0.2
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
