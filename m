From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:13 +0200
Subject: [Buildroot] [PATCH 22/32] luafilesystem: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-22-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luafilesystem/luafilesystem.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luafilesystem/luafilesystem.hash

diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
new file mode 100644
index 0000000..e91f9d6
--- /dev/null
+++ b/package/luafilesystem/luafilesystem.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	70121e78b8ef9365265b85027729d0520c1163f5609abfa9554b215a672f4e7a  luafilesystem-1.6.3-1.src.rock
-- 
2.1.4
