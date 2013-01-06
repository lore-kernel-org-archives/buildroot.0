From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:15 +0100
Subject: [Buildroot] [PATCH 03/28] x11r7: fix indentation
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <53d5ff556761cb3adf7740bd6f16671bb18418c4.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixup the indentation when including the X.org server Config.in to
match all the other inclusions in x11r7/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

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
-- 
1.7.9.5
