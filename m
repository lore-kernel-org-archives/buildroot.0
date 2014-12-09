From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:32:18 +0100
Subject: [Buildroot] [git commit] package/mpd: make all package names in
	help text uppercase
Message-ID: <20141209183233.92FD08016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc8fa8205d177619bc128468b255fb99f4626813
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the package name uppercase to be consistent in all the help texts.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 4097f52..3435b05 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -273,9 +273,9 @@ config BR2_PACKAGE_MPD_TCP
 	bool "tcp sockets"
 	default y
 	help
-	  Enable mpd to listen on tcp sockets.
+	  Enable MPD to listen on tcp sockets.
 
-	  You want this on if mpd and the client(s) work
+	  You want this on if MPD and the client(s) work
 	  on different machines (the usual scenario).
 
 config BR2_PACKAGE_MPD_UPNP
@@ -283,7 +283,7 @@ config BR2_PACKAGE_MPD_UPNP
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	help
-	  Enable mpd UPnP client support.
+	  Enable MPD UPnP client support.
 
 endif
 
