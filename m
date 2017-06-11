From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:24 +0200
Subject: [Buildroot] [PATCH 15/28] package/ltrace: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ltrace/ltrace.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ltrace/ltrace.hash

diff --git a/package/ltrace/ltrace.hash b/package/ltrace/ltrace.hash
new file mode 100644
index 000000000..58a9c6d2a
--- /dev/null
+++ b/package/ltrace/ltrace.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 894333bb7d347066c4e398d9f4a202af5f2faf80754905dd0e6a2259695baba0  ltrace-c22d359433b333937ee3d803450dc41998115685.tar.gz
-- 
2.11.0
