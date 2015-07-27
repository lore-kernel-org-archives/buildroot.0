From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:00 +0200
Subject: [Buildroot] [PATCH 09/32] lrandom: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lrandom/lrandom.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/lrandom/lrandom.hash

diff --git a/package/lrandom/lrandom.hash b/package/lrandom/lrandom.hash
new file mode 100644
index 0000000..3f60133
--- /dev/null
+++ b/package/lrandom/lrandom.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	96fbc56beb0efca20253301915e14ba25150e2b09541ea7a3570e0def624b196  lrandom-20120430.51-1.src.rock
+sha256	480a6cf11caaba99290ff30cd6e854ac9dce61e38b9d9caf5498165f7fb93454  lrandom-20120430.52-1.src.rock
-- 
2.1.4
