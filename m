From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Jan 2017 21:53:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/x264: add hash
Message-ID: <20170123205348.19608-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/x264.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x264/x264.hash

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
new file mode 100644
index 0000000000..c61e2a2df7
--- /dev/null
+++ b/package/x264/x264.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 888af681679374fa5147ba629eab8cf1704864ddd9ad6be3a8057a6c86bc9392  x264-b97ae0644f16bad2e2c9c9181264a946769a0aa0.tar.gz
-- 
2.11.0
