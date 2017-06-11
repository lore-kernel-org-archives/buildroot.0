From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:20 +0200
Subject: [Buildroot] [PATCH 11/28] package/libsilk: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsilk/libsilk.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsilk/libsilk.hash

diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
new file mode 100644
index 000000000..2eab1c0db
--- /dev/null
+++ b/package/libsilk/libsilk.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 01de52aa123f7bd20e500a076046f6b30d55f8e98c4029ab424bc51c46d7083d  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
-- 
2.11.0
