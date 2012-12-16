From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 20:23:17 +0100
Subject: [Buildroot] [git commit] usbredir: bump version
Message-ID: <20121216200126.2D9129A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da1147e763737f5dd4da3d20c5bf2109d5d85562
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbredir/usbredir.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index ac98472..f0530a7 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBREDIR_VERSION         = 0.4.3
+USBREDIR_VERSION         = 0.4.4
 USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE            = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE         = LGPLv2.1+
