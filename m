From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Mar 2015 13:52:50 +0100
Subject: [Buildroot] [PATCH] bsdiff: Add hash file
Message-ID: <550580A2.3030608@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/bsdiff/bsdiff.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/bsdiff/bsdiff.hash

diff --git a/package/bsdiff/bsdiff.hash b/package/bsdiff/bsdiff.hash
new file mode 100644
index 0000000..75846d3
--- /dev/null
+++ b/package/bsdiff/bsdiff.hash
@@ -0,0 +1,2 @@
+# From http://www.daemonology.net/bsdiff/:
+sha256	e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz
-- 
1.9.1
