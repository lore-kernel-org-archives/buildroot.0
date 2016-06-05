From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:39:54 +0200
Subject: [Buildroot] [PATCH 01/12] package/avrdude: add hash
Message-ID: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/avrdude/avrdude.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/avrdude/avrdude.hash

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
new file mode 100644
index 0000000..b2c6125
--- /dev/null
+++ b/package/avrdude/avrdude.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b32128f4812d5e852cfba2e863d950ec30e0f72f09bc14fb41c02528bbc5dd18 avrdude-ad04c429a90f4c34f000ea4ae11db2705915a31f.tar.gz
-- 
2.8.1
