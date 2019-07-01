From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:34 -0400
Subject: [Buildroot] [PATCH 22/22] package/x11r7/xserver_xorg-server: add
 license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-22-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index f79dc0c4eb..fe2a7ae55a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -8,3 +8,6 @@ md5 c9fc7e21e11286dbedd22c00df652130  xorg-server-1.20.5.tar.bz2
 sha1 fea6fd34c7f48b3c69fbecd8fb294eaa1498e69c  xorg-server-1.20.5.tar.bz2
 sha256 a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d  xorg-server-1.20.5.tar.bz2
 sha512 625f0626b122cf95600abe382c3217348999357a0e2d2443092f1b67cff1c98d7ef09303884ceaeac181e0555dc56b0d4d44bda45cc464dac2d9a50c5b32d631  xorg-server-1.20.5.tar.bz2
+
+# Locally calculated
+sha256 4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
-- 
2.21.0
