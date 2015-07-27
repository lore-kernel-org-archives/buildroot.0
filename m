From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:14 +0200
Subject: [Buildroot] [PATCH 23/32] luajson: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-23-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajson/luajson.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luajson/luajson.hash

diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
new file mode 100644
index 0000000..deda5ef
--- /dev/null
+++ b/package/luajson/luajson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	4898e5575713b37a1eb9badbd3968e15ec1856115daaed9819acf39113616619  luajson-1.3.3-1.src.rock
-- 
2.1.4
