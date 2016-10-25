From: Dagg Stompler <daggs@gmx.com>
Date: Tue, 25 Oct 2016 20:54:16 +0300
Subject: [Buildroot] [PATCH v2 2/3] xdriver_xf86-video-odroidc2: new package
In-Reply-To: <20161025175417.25901-1-daggs@gmx.com>
References: <20161025175417.25901-1-daggs@gmx.com>
Message-ID: <20161025175417.25901-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/x11r7/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 40aa80c..1c5ff7e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -174,6 +174,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
 		source package/x11r7/xdriver_xf86-video-nouveau/Config.in
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
+		source package/x11r7/xdriver_xf86-video-odroidc2/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
 		source package/x11r7/xdriver_xf86-video-qxl/Config.in
 		source package/x11r7/xdriver_xf86-video-r128/Config.in
-- 
2.10.1
