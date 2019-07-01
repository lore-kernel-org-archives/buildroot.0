From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:33 -0400
Subject: [Buildroot] [PATCH 21/22] package/x11r7/xlib_libXxf86vm: add
 license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-21-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
index cece6b56d0..2470617685 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
@@ -1,3 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2015-February/002539.html
 sha1	78ef18ca2be157131899e01c62679e247409a13f				libXxf86vm-1.1.4.tar.bz2
 sha256	afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57	libXxf86vm-1.1.4.tar.bz2
+
+# Locally calculated
+sha256	f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689	COPYING
-- 
2.21.0
