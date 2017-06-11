From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:21 +0200
Subject: [Buildroot] [PATCH 12/28] package/libsoundtouch: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsoundtouch/libsoundtouch.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsoundtouch/libsoundtouch.hash

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
new file mode 100644
index 000000000..af0c36283
--- /dev/null
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c805e7a72b7758a8986b71e73d2f94a8c79c66c1246fa2af1743c4282702e096  libsoundtouch-010a91a59071c7fefd316fca62c0d980ec85b4b1.tar.gz
-- 
2.11.0
