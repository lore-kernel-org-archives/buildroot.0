From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:03:55 +0200
Subject: [Buildroot] [git commit] gpsd: switch homepage now that berlios is
	gone
Message-ID: <20140618123420.024D59D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da4a44b48fbdbd156dffab3480f6ec8b8199fb16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fbbf7a9..6623900 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_GPSD
 
 	  The D-Bus interface is included if dbus-glib is enabled.
 
-	  http://gpsd.berlios.de/
+	  http://www.catb.org/gpsd/
 
 if BR2_PACKAGE_GPSD
 
