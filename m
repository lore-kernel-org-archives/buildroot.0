From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:02 +0200
Subject: [Buildroot] [PATCH 11/32] lua-cjson: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cjson/lua-cjson.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lua-cjson/lua-cjson.hash

diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
new file mode 100644
index 0000000..852dc67
--- /dev/null
+++ b/package/lua-cjson/lua-cjson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	db7af849c555d1a474f729fe4a56b5530e9be7b24749eb7a7c474a7c7207b972  lua-cjson-2.1.0-1.src.rock
-- 
2.1.4
