From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 06:05:08 -0500
Subject: [Buildroot] [PATCH] package/flannel: add license file hash
Message-ID: <20191027110508.27806-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/flannel/flannel.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 3e0b25cb4d..57c2daf6dc 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 dbbcb08c0e70713b0c920387a9967e5b30ef833c8118c847edbbca4f68ff0562 v0.5.5.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
-- 
2.17.1
