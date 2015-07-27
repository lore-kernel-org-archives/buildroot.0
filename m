From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:16 +0200
Subject: [Buildroot] [PATCH 25/32] luasec: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-25-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luasec/luasec.hash

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
new file mode 100644
index 0000000..1e9f70a
--- /dev/null
+++ b/package/luasec/luasec.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d2198cc39b3fa55bd5020046742b34093b6efcb619cf4032948b8c8556202a32  luasec-0.5-2.src.rock
-- 
2.1.4
