From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:50:56 +0200
Subject: [Buildroot] [PATCH 05/32] lbase64: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lbase64/lbase64.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lbase64/lbase64.hash

diff --git a/package/lbase64/lbase64.hash b/package/lbase64/lbase64.hash
new file mode 100644
index 0000000..0806090
--- /dev/null
+++ b/package/lbase64/lbase64.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7326658d48a70382b496eb88220b0c398c19ed712e39863939330fec0533362a  lbase64-20120820-1.src.rock
-- 
2.1.4
