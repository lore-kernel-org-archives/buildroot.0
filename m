From: Davide Viti <zinosat@tiscali.it>
Date: Wed,  1 Apr 2015 00:11:01 +0200
Subject: [Buildroot] [PATCHv2] mongoose: add hash file
Message-ID: <1427839861-11566-1-git-send-email-zinosat@tiscali.it>
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
index 0000000..5687094
--- /dev/null
+++ b/package/mongoose/mongoose.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	cc2557c7cf9f15e1e691f285a4c6c705cc7e56cb70c64cb49703a428a0677065  mongoose-5.6.tar.gz
-- 
2.1.4
