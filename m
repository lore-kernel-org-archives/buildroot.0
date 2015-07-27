From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:18 +0200
Subject: [Buildroot] [PATCH 27/32] luasql-sqlite3: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-27-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasql-sqlite3/luasql-sqlite3.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luasql-sqlite3/luasql-sqlite3.hash

diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
new file mode 100644
index 0000000..5728c8d
--- /dev/null
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e98d4e997682097f5bc2859596b9615f4cb87438db23ceb4af5e36b4424524ab  luasql-sqlite3-2.3.0-1.src.rock
-- 
2.1.4
