From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 21:44:25 +0200
Subject: [Buildroot] [git commit] matchbox: switch homepage and enhance
	description
Message-ID: <20150401194607.007AC7FED0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e3d100358d3de022ddea9bdcedae6345bba8d5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old homepage is dead so switch to the new URL.
Also make the description somewhat better.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

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
 
