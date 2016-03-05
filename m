From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  5 Mar 2016 21:02:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/czmq: add hash file
Message-ID: <1457208144-6613-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/czmq/czmq.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/czmq/czmq.hash

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
new file mode 100644
index 0000000..6398552
--- /dev/null
+++ b/package/czmq/czmq.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e56f8498daf70310b31c42669b2f9b753c5e747eafaff6d4fdac26d72a474b27  czmq-v3.0.2.tar.gz
-- 
2.7.2
