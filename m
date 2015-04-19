From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 19 Apr 2015 14:12:31 +0200
Subject: [Buildroot] [PATCH] package/python-m2crypto: add hash
Message-ID: <1429445551-13618-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/python-m2crypto/python-m2crypto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-m2crypto/python-m2crypto.hash

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
new file mode 100644
index 0000000..a5231ec
--- /dev/null
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -0,0 +1,2 @@
+# From https://pypi.python.org/pypi/M2Crypto/0.21.1
+md5 f93d8462ff7646397a9f77a2fe602d17 M2Crypto-0.21.1.tar.gz
-- 
2.3.5
