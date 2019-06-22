From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:48:49 +0200
Subject: [Buildroot] [git commit] package/libvncserver: fix homepage
Message-ID: <20190622154813.121888293F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5324d7e07a2a0e6db48b6fdd4d38c4a18d53a77b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libvncserver homepage is https://libvnc.github.io/, last version on
sourceforge is 0.9.9 (seven years ago)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvncserver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 460aa784e9..d5fac82e87 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBVNCSERVER
 	help
 	  libvncserver is a VNC server/client library.
 
-	  http://libvncserver.sourceforge.net/
+	  https://libvnc.github.io/
 
 if BR2_PACKAGE_LIBVNCSERVER
 
