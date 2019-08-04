From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:58 +0200
Subject: [Buildroot] [PATCH 15/18] package/lzo: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lzo/lzo.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
index cf2734fc7f..39a2dd4959 100644
--- a/package/lzo/lzo.hash
+++ b/package/lzo/lzo.hash
@@ -2,3 +2,4 @@
 sha1 4924676a9bae5db58ef129dc1cebce3baa3c4b5d  lzo-2.10.tar.gz
 # Locally computed
 sha256 c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072  lzo-2.10.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-- 
2.20.1
