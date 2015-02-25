From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 26 Feb 2015 00:05:06 +0100
Subject: [Buildroot] [PATCH v1 2/4] directfb: add hash
In-Reply-To: <1424905508-30186-1-git-send-email-ps.report@gmx.net>
References: <1424905508-30186-1-git-send-email-ps.report@gmx.net>
Message-ID: <1424905508-30186-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb/directfb.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/directfb/directfb.hash

diff --git a/package/directfb/directfb.hash b/package/directfb/directfb.hash
new file mode 100644
index 0000000..346b86e
--- /dev/null
+++ b/package/directfb/directfb.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3  DirectFB-1.7.7.tar.gz
+
-- 
2.1.4
