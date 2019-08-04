From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:42:01 +0200
Subject: [Buildroot] [PATCH 18/18] package/neon: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/neon/neon.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index d66b6fd74c..2ebefbe520 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca	neon-0.30.2.tar.gz
+# Locally computed
+sha256 95f77624e96f6728145826fc895142275451f43f41c073766db3dbbcc8b790b0  README
+sha256 d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
-- 
2.20.1
