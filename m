From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 21 Nov 2015 20:22:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/yajl: add hash
Message-ID: <1448133726-24457-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/yajl/yajl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/yajl/yajl.hash

diff --git a/package/yajl/yajl.hash b/package/yajl/yajl.hash
new file mode 100644
index 0000000..6e025a2
--- /dev/null
+++ b/package/yajl/yajl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	0e78f516dc53ecce7dc073f9a9bb0343186b58ef29dcd1dad74e5e853b216dd5  yajl-2.0.4.tar.gz
-- 
2.6.2
