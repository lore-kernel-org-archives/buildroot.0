From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:46 +0200
Subject: [Buildroot] [PATCH 03/18] package/dfu-util: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dfu-util/dfu-util.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dfu-util/dfu-util.hash b/package/dfu-util/dfu-util.hash
index bf618d1ae8..7c66a93376 100644
--- a/package/dfu-util/dfu-util.hash
+++ b/package/dfu-util/dfu-util.hash
@@ -3,3 +3,4 @@ md5	233bb1e08ef4b405062445d84e28fde6	dfu-util-0.9.tar.gz
 
 # Locally computed
 sha256	36428c6a6cb3088cad5a3592933385253da5f29f2effa61518ee5991ea38f833	dfu-util-0.9.tar.gz
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
-- 
2.20.1
