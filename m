From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 06:07:58 -0500
Subject: [Buildroot] [PATCH] package/dt: add license hash
Message-ID: <20191027110758.52222-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/dt/dt.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dt/dt.hash b/package/dt/dt.hash
index 7cd8c643e1..f4de295f51 100644
--- a/package/dt/dt.hash
+++ b/package/dt/dt.hash
@@ -3,3 +3,5 @@
 md5	3054aeaaba047a1dbe90c2132a382ee2	dt-source-v18.32.tar.gz
 # Calculated based on the hash above
 sha256	10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6	dt-source-v18.32.tar.gz
+
+sha256  49f47f20de4b44dc3505ed0cc55bfbfe0fc3e41956ab546f1eeedcf554def54c	LICENSE
-- 
2.17.1
