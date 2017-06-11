From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:17 +0200
Subject: [Buildroot] [PATCH 08/28] package/libcodec2: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcodec2/libcodec2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcodec2/libcodec2.hash

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
new file mode 100644
index 000000000..ba1263525
--- /dev/null
+++ b/package/libcodec2/libcodec2.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7e5d5a93f34e3d6f663ec9beb586678074a531996a6398360a59946bfdfa49c2  libcodec2-392a55b4f3f8ad30d845ac6ae35e8b27343bb944.tar.gz
-- 
2.11.0
