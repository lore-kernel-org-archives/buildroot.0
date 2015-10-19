From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 19 Oct 2015 22:45:25 +0200
Subject: [Buildroot] [PATCH 1/3] package/swupdate: add hash file
Message-ID: <1445287527-30196-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/swupdate.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/swupdate/swupdate.hash

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
new file mode 100644
index 0000000..6d69d66
--- /dev/null
+++ b/package/swupdate/swupdate.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
-- 
2.6.1
