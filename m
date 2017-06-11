From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:30 +0200
Subject: [Buildroot] [PATCH 21/28] package/sunxi-mali: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sunxi-mali/sunxi-mali.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sunxi-mali/sunxi-mali.hash

diff --git a/package/sunxi-mali/sunxi-mali.hash b/package/sunxi-mali/sunxi-mali.hash
new file mode 100644
index 000000000..31b5990de
--- /dev/null
+++ b/package/sunxi-mali/sunxi-mali.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c5f58b2c0533a74f491634ddbd80d888781f4ea29ecc5c24bd7300c02bef1145  sunxi-mali-d343311efc8db166d8371b28494f0f27b6a5872.tar.gz
-- 
2.11.0
