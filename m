From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Mar 2015 13:53:21 +0100
Subject: [Buildroot] [PATCH] berkeleydb: Add hash file
Message-ID: <550580C1.9070305@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/berkeleydb/berkeleydb.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/berkeleydb/berkeleydb.hash

diff --git a/package/berkeleydb/berkeleydb.hash b/package/berkeleydb/berkeleydb.hash
new file mode 100644
index 0000000..e47c578
--- /dev/null
+++ b/package/berkeleydb/berkeleydb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	76a25560d9e52a198d37a31440fd07632b5f1f8f9f2b6d5438f4bc3e7c9013ef  db-5.3.28.NC.tar.gz
-- 
1.9.1
