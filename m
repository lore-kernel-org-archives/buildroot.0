From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  9 Jun 2015 08:03:55 +0300
Subject: [Buildroot] [PATCH] stress: add hash file
Message-ID: <5403625348634d9e572aadb582f4abe1b5d0d566.1433826235.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stress/stress.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/stress/stress.hash

diff --git a/package/stress/stress.hash b/package/stress/stress.hash
new file mode 100644
index 000000000000..24cf0431b2be
--- /dev/null
+++ b/package/stress/stress.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b stress-1.0.4.tar.gz
-- 
2.1.4
