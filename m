From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:12 +0200
Subject: [Buildroot] [PATCH 21/32] luaexpat: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-21-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaexpat/luaexpat.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luaexpat/luaexpat.hash

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
new file mode 100644
index 0000000..27f6ed0
--- /dev/null
+++ b/package/luaexpat/luaexpat.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	aa7883a0d44f500e32ef306c04632546f97f33159fffa7bcdc3f451170f95896  luaexpat-1.3.0-1.src.rock
-- 
2.1.4
