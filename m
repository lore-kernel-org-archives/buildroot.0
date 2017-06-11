From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:15 +0200
Subject: [Buildroot] [PATCH 06/28] package/i2c-tools: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/i2c-tools/i2c-tools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/i2c-tools/i2c-tools.hash

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
new file mode 100644
index 000000000..e45e5324b
--- /dev/null
+++ b/package/i2c-tools/i2c-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 972b8da73b5aada91e8f21573cf5dbf6dc2d5d64864210e80b2b1aa710a66d02  i2c-tools-v3.1.2.tar.gz
-- 
2.11.0
