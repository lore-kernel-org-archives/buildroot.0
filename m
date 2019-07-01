From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:17 -0400
Subject: [Buildroot] [PATCH 05/22] package/libtheora: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libtheora/libtheora.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtheora/libtheora.hash b/package/libtheora/libtheora.hash
index daf245570a..45376ddaa4 100644
--- a/package/libtheora/libtheora.hash
+++ b/package/libtheora/libtheora.hash
@@ -1,2 +1,6 @@
 # From http://downloads.xiph.org/releases/theora/SHA256SUMS
 sha256	f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61	libtheora-1.1.1.tar.xz
+
+# Locally calculated
+sha256	8417fad7da775735564e209484a2e011e0fa201e94f01fdbee6e4977e478e6fc	COPYING
+sha256	654a0238f789f4435c4818f50005b141d013c5a09a31d861efc1d0d67ba975a4	LICENSE
-- 
2.21.0
