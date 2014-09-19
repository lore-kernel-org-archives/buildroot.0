From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 19 Sep 2014 20:30:24 +0200
Subject: [Buildroot] [PATCH 2/2] luajit: add hash
In-Reply-To: <1411151424-31768-1-git-send-email-francois.perrad@gadz.org>
References: <1411151424-31768-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1411151424-31768-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luajit/luajit.hash

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
new file mode 100644
index 0000000..9c238e7
--- /dev/null
+++ b/package/luajit/luajit.hash
@@ -0,0 +1,2 @@
+# Hashes from: http://luajit.org/download.html
+md5 f14e9104be513913810cd59c8c658dc0    LuaJIT-2.0.3.tar.gz
-- 
1.9.1
