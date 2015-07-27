From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:10 +0200
Subject: [Buildroot] [PATCH 19/32] luabitop: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-19-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luabitop/luabitop.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luabitop/luabitop.hash

diff --git a/package/luabitop/luabitop.hash b/package/luabitop/luabitop.hash
new file mode 100644
index 0000000..7811020
--- /dev/null
+++ b/package/luabitop/luabitop.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
-- 
2.1.4
