From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:48 +0200
Subject: [Buildroot] [git commit] x11r7: update Config.in
Message-ID: <20120922194224.BA75E99625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69e6cd4a2fa80d9299d9e763923f6adae46919a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't mention the revision in the option text (we're now at 7.6)
and add the upstream URL.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 664226f..bb538e1 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,5 +1,5 @@
 menuconfig BR2_PACKAGE_XORG7
-	bool "X.org X Window System, X11R7, release 7.5"
+	bool "X.org X Window System"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_EXPAT
@@ -9,6 +9,8 @@ menuconfig BR2_PACKAGE_XORG7
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
 
+	  http://xorg.freedesktop.org
+
 if BR2_PACKAGE_XORG7
 
 choice
