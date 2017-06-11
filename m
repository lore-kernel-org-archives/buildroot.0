From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:29 +0200
Subject: [Buildroot] [PATCH 20/28] package/kvmtool: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kvmtool/kvmtool.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/kvmtool/kvmtool.hash

diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
new file mode 100644
index 000000000..657fdb315
--- /dev/null
+++ b/package/kvmtool/kvmtool.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5633d8dd1542996108bf9b75c9f2cf6bf13fb27bfd453ec250b3e5405e85f6ac  kvmtool-bed2bd9e1fbef5819090feeada7b86eed97ca5e2.tar.gz
-- 
2.11.0
