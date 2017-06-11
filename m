From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:22 +0200
Subject: [Buildroot] [PATCH 13/28] package/libuci: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libuci/libuci.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libuci/libuci.hash

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
new file mode 100644
index 000000000..d4c839eb8
--- /dev/null
+++ b/package/libuci/libuci.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 bb9827863c6b7b6cf986a3de42b5716edb8a280e44b3ce39541de18062c3c00e  libuci-49ec6efbdac4819033d34f08927d795f83a3932d.tar.gz
-- 
2.11.0
