From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 22:44:33 +0200
Subject: [Buildroot] [PATCH 6/7] package/ijs: add license hash
In-Reply-To: <20190728204434.12356-1-bernd.kuhls@t-online.de>
References: <20190728204434.12356-1-bernd.kuhls@t-online.de>
Message-ID: <20190728204434.12356-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ijs/ijs.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ijs/ijs.hash b/package/ijs/ijs.hash
index 1a8f564efd..6accb57123 100644
--- a/package/ijs/ijs.hash
+++ b/package/ijs/ijs.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9  ijs-0.35.tar.bz2
+sha256	f723390b7ee019eccf07763dcb5744acf8bb43034bc3ba3d6f1c94440e365b4f  README
-- 
2.20.1
