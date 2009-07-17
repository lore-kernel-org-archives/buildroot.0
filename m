From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:03:10 +0200
Subject: [Buildroot] [PATCH 03/13] xorg: remove useless configuration comment
In-Reply-To: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8c00f439048fbccbae1b22427648b10390a09748.1247846597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.0.4
