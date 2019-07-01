From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:30 -0400
Subject: [Buildroot] [PATCH 18/22] package/x11r7/xlib_libXrender: add
 license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-18-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index bbc5b898b3..e1753594ca 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,2 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2016-October/002725.html
 sha256 c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949  libXrender-0.9.10.tar.bz2
+
+# Locally calculated
+sha256 bbe1db89c48816c48248796adac91defd8fbde1141b145f01511781ab87f29a1  COPYING
-- 
2.21.0
