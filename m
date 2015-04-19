From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 19 Apr 2015 13:44:39 +0200
Subject: [Buildroot] [PATCH] package/yasm: add hash
Message-ID: <1429443879-30381-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/yasm/yasm.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/yasm/yasm.hash

diff --git a/package/yasm/yasm.hash b/package/yasm/yasm.hash
new file mode 100644
index 0000000..d5cf267
--- /dev/null
+++ b/package/yasm/yasm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31 yasm-1.2.0.tar.gz
-- 
2.3.5
