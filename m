From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 10 Apr 2016 18:59:28 +0200
Subject: [Buildroot] [PATCH 1/3] pcsc-lite: add hash file
Message-ID: <1460307570-10914-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/pcsc-lite/pcsc-lite.hash

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
new file mode 100644
index 0000000..3adb865
--- /dev/null
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 607c4bd730526d282a63edb2ba4ee043f497877be642c5c647e37995e21f2612 pcsc-lite-1.8.10.tar.bz2
-- 
2.8.1
