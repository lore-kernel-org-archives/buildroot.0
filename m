From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:23 +0200
Subject: [Buildroot] [PATCH 14/28] package/libyuv: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libyuv/libyuv.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libyuv/libyuv.hash

diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
new file mode 100644
index 000000000..0361ce6ee
--- /dev/null
+++ b/package/libyuv/libyuv.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ec31df87fc42153723e9ca65a6d71b0993504c3de5f925e79464c93b7ef66094  libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.tar.gz
-- 
2.11.0
