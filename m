From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:12 +0200
Subject: [Buildroot] [PATCH 03/28] package/edid-decode: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/edid-decode/edid-decode.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/edid-decode/edid-decode.hash

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
new file mode 100644
index 000000000..0c2c6a2cf
--- /dev/null
+++ b/package/edid-decode/edid-decode.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ec85b62e863a1ad4636e1a216c122e459d7847c71ff6d57e4bf44406d9cbeb40  edid-decode-681153145d5e05ee15032ea792e967cda06e7622.tar.gz
-- 
2.11.0
