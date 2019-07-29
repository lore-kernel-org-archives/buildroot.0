From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:06 +0200
Subject: [Buildroot] [PATCH 05/11] package/jsmin: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jsmin/jsmin.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jsmin/jsmin.hash b/package/jsmin/jsmin.hash
index 6080f109dc..c160978519 100644
--- a/package/jsmin/jsmin.hash
+++ b/package/jsmin/jsmin.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 aae127bf7291a7b2592f36599e5ed6c6423eac7abe0cd5992f82d6d46fe9ed2d  jsmin-1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
+sha256 b420f61778af09534adc836a5086f5625b8499124051c50baefa218e7c03a58c  jsmin.c
-- 
2.20.1
