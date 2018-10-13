From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Oct 2018 10:01:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/luvi: add license hash
In-Reply-To: <20181013080103.29974-1-bernd.kuhls@t-online.de>
References: <20181013080103.29974-1-bernd.kuhls@t-online.de>
Message-ID: <20181013080103.29974-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/luvi/luvi.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index e2239b6171..22e5cfa7bf 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  ce9a1fb762e61267618ddea9ea129170fd543bb918c382b71cb35985d0024c42  luvi-src-v2.7.6.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
-- 
2.19.1
