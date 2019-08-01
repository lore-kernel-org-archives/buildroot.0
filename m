From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:33:40 +0200
Subject: [Buildroot] [git commit] package/jsmin: add license hash
Message-ID: <20190801073838.10A11813D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a080a301b0fe63b62032ab750de31e62cb223be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
