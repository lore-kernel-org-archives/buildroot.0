From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Fri, 19 Jun 2015 17:29:52 +0200
Subject: [Buildroot] [PATCH 2/4] README file for wifi/bluetooth support
In-Reply-To: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
References: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
Message-ID: <1434727794-9419-2-git-send-email-lambertarthur22@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arthur LAMBERT <lambertarthur22@gmail.com>
---
 board/freescale/warpboard/README | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 board/freescale/warpboard/README

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
new file mode 100644
index 0000000..0ec6b97
--- /dev/null
+++ b/board/freescale/warpboard/README
@@ -0,0 +1,6 @@
+# Enable bluetooth :
+hciattach /dev/ttymxc4 3wire
+hciconfig hci0 up
+
+# Enable Wifi :
+modprobe brcmfmac
-- 
1.9.1
