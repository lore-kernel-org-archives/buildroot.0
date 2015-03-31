From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 15:45:31 -0300
Subject: [Buildroot] [PATCH 01/10] matchbox: switch homepage and enhance
	description
Message-ID: <1427827540-15836-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old homepage is dead so switch to the new URL.
Also make the description somewhat better.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/matchbox/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index b70133e..7867ae3 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -8,7 +8,12 @@ config BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	help
-	  http://projects.o-hand.com/matchbox
+	  Matchbox is an Open Source base environment for the X Window
+	  System running on non-desktop embedded platforms such as
+	  handhelds, set-top boxes, kiosks and anything else for which
+	  screen space, input mechanisms or system resources are limited.
+
+	  http://matchbox-project.org/
 
 if BR2_PACKAGE_MATCHBOX
 
-- 
2.0.5
