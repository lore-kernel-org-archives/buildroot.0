From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:11 +0200
Subject: [Buildroot] [PATCH 20/32] luacrypto: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-20-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luacrypto/luacrypto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luacrypto/luacrypto.hash

diff --git a/package/luacrypto/luacrypto.hash b/package/luacrypto/luacrypto.hash
new file mode 100644
index 0000000..5c57767
--- /dev/null
+++ b/package/luacrypto/luacrypto.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	dc935c923b8851208d5d504b343448a9d5bd3e537bb8657875f12d72155600b8  luacrypto-0.3.2-1.src.rock
-- 
2.1.4
