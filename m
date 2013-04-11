From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:02:09 +0200
Subject: [Buildroot] [git commit] mesa3d: requires host-bison and host-flex
Message-ID: <20130411140827.D5AF89B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c4aa7a3028bce2cf7c6a779376f7efae1ce4224
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a local build failure when testing other things.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 7b7f5b4..397dbb2 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -30,6 +30,8 @@ MESA3D_DEPENDENCIES = \
 	expat \
 	host-xutil_makedepend \
 	host-libxml2 \
-	host-python
+	host-python \
+	host-bison \
+	host-flex
 
 $(eval $(autotools-package))
