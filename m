From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Jun 2019 15:33:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/libvncserver: fix homepage
Message-ID: <20190622133310.9709-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libvncserver homepage is https://libvnc.github.io/, last version on
sourceforge is 0.9.9 (seven years ago)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
 
-- 
2.20.1
