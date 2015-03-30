From: Davide Viti <zinosat@tiscali.it>
Date: Mon, 30 Mar 2015 23:20:40 +0200
Subject: [Buildroot] [PATCH 1/1] mongoose: add hash file
Message-ID: <1427750440-5020-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/mongoose/mongoose.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mongoose/mongoose.hash

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
new file mode 100644
index 0000000..b7e758c
--- /dev/null
+++ b/package/mongoose/mongoose.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+cc2557c7cf9f15e1e691f285a4c6c705cc7e56cb70c64cb49703a428a0677065  mongoose-5.6.tar.gz
-- 
2.1.4
