From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 May 2015 06:21:23 +0200
Subject: [Buildroot] [PATCH 4/7] package/ux500-firmware: add hash file
In-Reply-To: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432095686-18628-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/ux500-firmware/ux500-firmware.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ux500-firmware/ux500-firmware.hash

diff --git a/package/ux500-firmware/ux500-firmware.hash b/package/ux500-firmware/ux500-firmware.hash
new file mode 100644
index 0000000..1028cc0
--- /dev/null
+++ b/package/ux500-firmware/ux500-firmware.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 81633274a9157c076e5e09b5addd81fbcef504b829fc801041cea50eea774bcd ux500-firmware_1.1.3-6linaro1.tar.gz
-- 
2.4.1
