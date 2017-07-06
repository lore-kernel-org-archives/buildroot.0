From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed,  5 Jul 2017 23:41:34 -0300
Subject: [Buildroot] [PATCH] atop: add hash for license file
Message-ID: <20170706024134.21145-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/atop/atop.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 7a7bffbfa9..9ee0d62bc6 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256  73e4725de0bafac8c63b032e8479e2305e3962afbe977ec1abd45f9e104eb264  atop-2.3.0.tar.gz
+
+# Hash for license file:
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
-- 
2.11.0
