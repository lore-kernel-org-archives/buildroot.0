From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Mar 2015 13:52:41 +0100
Subject: [Buildroot] [PATCH] bc: Add hash file
Message-ID: <55058099.7070200@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/bc/bc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/bc/bc.hash

diff --git a/package/bc/bc.hash b/package/bc/bc.hash
new file mode 100644
index 0000000..241e9a2
--- /dev/null
+++ b/package/bc/bc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33  bc-1.06.tar.gz
-- 
1.9.1
