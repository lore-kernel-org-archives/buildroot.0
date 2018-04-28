From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 15:12:08 +0200
Subject: [Buildroot] [PATCH 1/1] libcddb: add hash for license file
Message-ID: <20180428131208.25729-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcddb/libcddb.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcddb/libcddb.hash b/package/libcddb/libcddb.hash
index 9e60683ea3..55dbbcbe13 100644
--- a/package/libcddb/libcddb.hash
+++ b/package/libcddb/libcddb.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b	libcddb-1.3.2.tar.bz2
+sha256	7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852	COPYING 
-- 
2.14.1
