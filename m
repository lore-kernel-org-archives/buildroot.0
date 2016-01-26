From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 22:50:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/odhcp6c: add hash
Message-ID: <1453845013-24697-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/odhcp6c/odhcp6c.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/odhcp6c/odhcp6c.hash

diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
new file mode 100644
index 0000000..00a0960
--- /dev/null
+++ b/package/odhcp6c/odhcp6c.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	b5f920ed300309d65e431a360cae5f3c2010eca09a4231c9ef907c730d3c0d09	odhcp6c-dc186d6d2b0dd4ad23ca5fc69c00e81f796ff6d9.tar.gz
-- 
2.7.0.rc3
