From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Jun 2016 20:00:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/lcdapi: add hash
In-Reply-To: <1465408811-23153-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465408811-23153-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465408811-23153-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lcdapi/lcdapi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lcdapi/lcdapi.hash

diff --git a/package/lcdapi/lcdapi.hash b/package/lcdapi/lcdapi.hash
new file mode 100644
index 0000000..98c42f8
--- /dev/null
+++ b/package/lcdapi/lcdapi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 fa26b53fd543ebab825d55cafb4c88af6a71ac3dcf86d4e8bcd3592be4212b55 lcdapi-v0.10.tar.gz
-- 
2.8.1
