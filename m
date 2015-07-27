From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:23 +0200
Subject: [Buildroot] [PATCH 32/32] xavante: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-32-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xavante/xavante.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/xavante/xavante.hash

diff --git a/package/xavante/xavante.hash b/package/xavante/xavante.hash
new file mode 100644
index 0000000..d960c2d
--- /dev/null
+++ b/package/xavante/xavante.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d683bebdb3e1b497dc04ceb3fb8f1c8c67a6486ab0c6da0c23f281cc07a63657  xavante-2.3.0-1.src.rock
-- 
2.1.4
