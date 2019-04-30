From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 30 Apr 2019 14:19:39 +0200
Subject: [Buildroot] [PATCH] package/luajit: add hash for the license file
Message-ID: <20190430121939.16166-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luajit/luajit.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 2081d12724..7e2d87ebb2 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,2 +1,5 @@
 # Hashes from: http://luajit.org/download.html
 md5 48353202cbcacab84ee41a5a70ea0a2c    LuaJIT-2.0.5.tar.gz
+
+# Locally calculated
+sha256 accb335aa3102f80d31caa2c2508fbcb795314106493519a367f13a87d0e87de  COPYRIGHT
-- 
2.21.0
