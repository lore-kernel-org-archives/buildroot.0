From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 20 Nov 2015 21:54:39 +0100
Subject: [Buildroot] [PATCH 1/3] package/zmqpp: add hash file
Message-ID: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/zmqpp/zmqpp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/zmqpp/zmqpp.hash

diff --git a/package/zmqpp/zmqpp.hash b/package/zmqpp/zmqpp.hash
new file mode 100644
index 0000000..3d4a984
--- /dev/null
+++ b/package/zmqpp/zmqpp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	92cb5bf7e1df8b99792fe1eb530bf91fced9c2d14159007bec011bb1b8248269  zmqpp-3.2.0.tar.gz
-- 
2.6.2
