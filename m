From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:27 -0400
Subject: [Buildroot] [PATCH 15/22] package/x11r7/xlib_libXfixes: add license
 hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-15-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index d96e5c6a70..0a42154d98 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,2 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2016-October/002722.html
 sha256 de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6  libXfixes-5.0.3.tar.bz2
+
+# Locally calculated
+sha256 d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
-- 
2.21.0
