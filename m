From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:40:05 +0200
Subject: [Buildroot] [PATCH 12/12] package/zyre: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zyre/zyre.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/zyre/zyre.hash

diff --git a/package/zyre/zyre.hash b/package/zyre/zyre.hash
new file mode 100644
index 0000000..5b38b80
--- /dev/null
+++ b/package/zyre/zyre.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0ce8328a2b9fe46aafc4627fc4ebd4d815f4d9f7d9708088459306c87bf5fb4b zyre-1d949e4bf79b694ea883c325f5813e87ddc2a687.tar.gz
-- 
2.8.1
