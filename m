From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 20 Apr 2015 05:25:45 +0200
Subject: [Buildroot] [PATCH 3/3] package/b43-firmware: add hash
In-Reply-To: <1429500345-31730-1-git-send-email-fabio.porcedda@gmail.com>
References: <1429500345-31730-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1429500345-31730-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/b43-firmware/b43-firmware.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/b43-firmware/b43-firmware.hash

diff --git a/package/b43-firmware/b43-firmware.hash b/package/b43-firmware/b43-firmware.hash
new file mode 100644
index 0000000..bafd00c
--- /dev/null
+++ b/package/b43-firmware/b43-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 f1e7067aac5b62b67b8b6e4c517990277804339ac16065eb13c731ff909ae46f broadcom-wl-5.100.138.tar.bz2
-- 
2.3.5
