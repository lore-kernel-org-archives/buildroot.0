From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:20 +0200
Subject: [Buildroot] [PATCH 29/32] lzlib: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-29-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lzlib/lzlib.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lzlib/lzlib.hash

diff --git a/package/lzlib/lzlib.hash b/package/lzlib/lzlib.hash
new file mode 100644
index 0000000..d823e8b
--- /dev/null
+++ b/package/lzlib/lzlib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c10055bde2c0a0ed14f22c1ee0701910b0b9885245baf7911201ab4dfd3b828c  lzlib-0.4.work3-1.src.rock
-- 
2.1.4
