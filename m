From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:22 +0200
Subject: [Buildroot] [PATCH 31/32] rings: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-31-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/rings/rings.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rings/rings.hash

diff --git a/package/rings/rings.hash b/package/rings/rings.hash
new file mode 100644
index 0000000..59da2fa
--- /dev/null
+++ b/package/rings/rings.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	627ac55d4a420fab766e6870fcd82cb39da12fb4ec8efddc7220b188a4ad4bc3  rings-1.3.0-1.src.rock
-- 
2.1.4
