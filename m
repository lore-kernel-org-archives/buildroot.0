From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:32 -0400
Subject: [Buildroot] [PATCH 20/22] package/x11r7/xlib_libXv: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-20-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index 4cb26eac71..ccc6727017 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,2 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2016-October/002727.html
 sha256 d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088  libXv-1.0.11.tar.bz2
+
+# Locally calculated
+sha256 4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
-- 
2.21.0
