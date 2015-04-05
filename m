From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun,  5 Apr 2015 17:15:04 -0500
Subject: [Buildroot] [PATCH v5 1/2] i2c-tools: add hash file
Message-ID: <1428272105-27627-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v2->v3:
 - None
---
 package/i2c-tools/i2c-tools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/i2c-tools/i2c-tools.hash

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
new file mode 100644
index 0000000..a6c376f
--- /dev/null
+++ b/package/i2c-tools/i2c-tools.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256	14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700  i2c-tools-3.1.1.tar.bz2
-- 
1.9.1
