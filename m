From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 23:38:23 +0200
Subject: [Buildroot] [PATCH 1/1] libnatpmp: add hash for license file
Message-ID: <20180504213823.4917-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnatpmp/libnatpmp.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnatpmp/libnatpmp.hash b/package/libnatpmp/libnatpmp.hash
index a5cab3ce26..baf9b35392 100644
--- a/package/libnatpmp/libnatpmp.hash
+++ b/package/libnatpmp/libnatpmp.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0  libnatpmp-20150609.tar.gz
+sha256 e8d8277e1a101fcfedb0cd5a1cc76646522c0da69f3490dd5a4055fc87ea96a2  LICENSE
-- 
2.14.1
