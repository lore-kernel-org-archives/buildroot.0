From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Apr 2015 17:56:46 -0300
Subject: [Buildroot] [PATCH] python: add hash file
Message-ID: <1429390606-14119-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though there's a hash at
https://www.python.org/downloads/release/python-279/ prefer using the
sig since that's just md5.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python/python.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python/python.hash

diff --git a/package/python/python.hash b/package/python/python.hash
new file mode 100644
index 0000000..f741e85
--- /dev/null
+++ b/package/python/python.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916	Python-2.7.9.tar.xz
-- 
2.0.5
