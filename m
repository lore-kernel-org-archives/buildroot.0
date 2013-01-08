From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:12:22 +0100
Subject: [Buildroot] [git commit] x11r7: fix indentation
Message-ID: <20130108232311.582789A6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50ca9a88a7394ba3ba48849f7d7dd5c3aac15316
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixup the indentation when including the X.org server Config.in to
match all the other inclusions in x11r7/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index dc84798..60c022f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -12,10 +12,9 @@ menuconfig BR2_PACKAGE_XORG7
 	  http://xorg.freedesktop.org
 
 if BR2_PACKAGE_XORG7
-
-menu "X11R7 Servers"
-	source package/x11r7/xserver_xorg-server/Config.in
-endmenu
+	menu "X11R7 Servers"
+		source package/x11r7/xserver_xorg-server/Config.in
+	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
