From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:15 +0200
Subject: [Buildroot] [PATCH 24/32] lualogging: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-24-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualogging/lualogging.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lualogging/lualogging.hash

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
new file mode 100644
index 0000000..8a6211e
--- /dev/null
+++ b/package/lualogging/lualogging.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	6ca3827c4903814626b96011e17ad99b42ecfa983b605aa75bf58f17e90ed58d  lualogging-1.3.0-1.src.rock
-- 
2.1.4
