From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:13 +0200
Subject: [Buildroot] [PATCH 04/28] package/f2fs-tools: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/f2fs-tools/f2fs-tools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/f2fs-tools/f2fs-tools.hash

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
new file mode 100644
index 000000000..36c3b115c
--- /dev/null
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 aefd2a67e8ddf9db92145dde41b4a697d1c498ff2e113fbfd26ce1efa6cc3f2d  f2fs-tools-v1.8.0.tar.gz
-- 
2.11.0
