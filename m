From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  9 Mar 2015 15:30:14 +0100
Subject: [Buildroot] [PATCH 1/1] network-manager: add hash file
Message-ID: <1425911414-31038-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/network-manager/network-manager.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/network-manager/network-manager.hash

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
new file mode 100644
index 0000000..07513a9
--- /dev/null
+++ b/package/network-manager/network-manager.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3a66afec670c975edd9832e620b725a5f16ed267a1b9e1b2d51ef27250d85947  NetworkManager-1.0.0.tar.xz
-- 
2.1.4
