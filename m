From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] xorg: remove useless configuration comment
Message-ID: <20090725071548.1E6B977713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c00f439048fbccbae1b22427648b10390a09748
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index dad0924..ace438a 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -327,7 +327,3 @@ endmenu
 		source package/x11r7/xkeyboard-config/Config.in
 	endmenu
 endif
-
-comment "X11R7 X Window System disabled"
-	depends on BR2_PACKAGE_TINYX||BR2_PACKAGE_XORG
-
-- 
1.6.3.3
