From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 17:55:47 +0300
Subject: [Buildroot] [PATCH] nmap: add hash file
Message-ID: <d2bed1bec25ab102868c298de7be84fd4cee7a2e.1436799347.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nmap/nmap.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nmap/nmap.hash

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
new file mode 100644
index 000000000000..8c8da0075848
--- /dev/null
+++ b/package/nmap/nmap.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 8fa11e9e203ce2d81a207db5ca4f110a525f6c01c1dd0018325a7112a51aa591 nmap-6.47.tar.bz2
-- 
2.1.4
