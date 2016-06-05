From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:40:04 +0200
Subject: [Buildroot] [PATCH 11/12] package/zlog: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zlog/zlog.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/zlog/zlog.hash

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
new file mode 100644
index 0000000..1de23c9
--- /dev/null
+++ b/package/zlog/zlog.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d3afb1f0ce67df29f759da74235949370ac2818faf242f3f674cb48f9f4c57d3 zlog-6ddb9bbf3ff0123e701bf60996f351576ebe9c00.tar.gz
-- 
2.8.1
