From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:50:53 +0200
Subject: [Buildroot] [PATCH 02/32] copas: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/copas/copas.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/copas/copas.hash

diff --git a/package/copas/copas.hash b/package/copas/copas.hash
new file mode 100644
index 0000000..35dff2f
--- /dev/null
+++ b/package/copas/copas.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	05be032ac2f3a32eb2eb536d41d2f5af620dded6e158c54d1ab0f73d2957dc68  copas-2.0.0-1.src.rock
-- 
2.1.4
