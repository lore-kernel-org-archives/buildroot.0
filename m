From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:01 +0200
Subject: [Buildroot] [PATCH 10/32] lsqlite: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsqlite3/lsqlite3.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lsqlite3/lsqlite3.hash

diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
new file mode 100644
index 0000000..23273bb
--- /dev/null
+++ b/package/lsqlite3/lsqlite3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	b49b5941af92a6e7834a45f76dba1f6ea8f817cda373655f59c9da78416d1dfc  lsqlite3-0.9.3-0.src.rock
-- 
2.1.4
