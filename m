From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 14:40:49 +0200
Subject: [Buildroot] [git commit] package/luajit: add hash for the license
 file
Message-ID: <20190430123739.8445A83B69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86a7f00919d162cc7b57047a768b7693ff08552b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
