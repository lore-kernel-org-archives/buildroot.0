From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:28 -0400
Subject: [Buildroot] [PATCH 16/22] package/x11r7/xlib_libXfont: add license
 hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-16-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.hash b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
index ea04348719..ef4db95a1d 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.hash
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
@@ -3,3 +3,6 @@ md5  16eaf156edd79b68038b6a7c44aa9e9b  libXfont-1.5.4.tar.bz2
 sha1 9db050f63b9c4cb19e0dbb40575558ccb95719ca  libXfont-1.5.4.tar.bz2
 sha256 1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242  libXfont-1.5.4.tar.bz2
 sha512 864edbaff45c44bd92bc4b06275c73fdf584a9b88bc523a297d4c75c01ca253f438463e929af70d753ddecfa648bb0b9bcf0ec72267db9f2b1704f7afa906cb3  libXfont-1.5.4.tar.bz2
+
+# Locally calculated
+sha256 97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
-- 
2.21.0
