From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 17:09:32 +0200
Subject: [Buildroot] [PATCH 1/1] libestr: add hash for license file
Message-ID: <20180429150932.8675-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libestr/libestr.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libestr/libestr.hash b/package/libestr/libestr.hash
index e37cbb13c2..dcb504d3e1 100644
--- a/package/libestr/libestr.hash
+++ b/package/libestr/libestr.hash
@@ -1,2 +1,5 @@
 # From http://libestr.adiscon.com/download/libestr-0-1-10/
 sha256	bd655e126e750edd18544b88eb1568d200a424a0c23f665eb14bbece07ac703c	libestr-0.1.10.tar.gz
+
+# Hash for license file:
+sha256	835b4793da5cbb8965fbd63905b55a4cb4310b7d1b882077d23066b08f901ff8	COPYING
-- 
2.14.1
