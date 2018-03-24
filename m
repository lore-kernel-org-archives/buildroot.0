From: Martin Bark <martin@barkynet.com>
Date: Sat, 24 Mar 2018 14:10:17 +0000
Subject: [Buildroot] [PATCH v4 7/7] DEVELOPERS: add myself for rpi packages
In-Reply-To: <1521900617-32102-1-git-send-email-martin@barkynet.com>
References: <1521900617-32102-1-git-send-email-martin@barkynet.com>
Message-ID: <1521900617-32102-8-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v3 -> v4
 - none

Changes v2 -> v3
 - new in v3
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 031af3c..0c4cabe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1136,9 +1136,14 @@ F:	package/harfbuzz/
 F:	package/libsecret/
 
 N:	Martin Bark <martin@barkynet.com>
+F:	board/raspberrypi/
+F:	configs/raspberrypi3_defconfig
 F:	package/ca-certificates/
 F:	package/connman/
 F:	package/nodejs/
+F:	package/rpi-bt-firmware/
+F:	package/rpi-firmware/
+F:	package/rpi-wifi-firmware/
 F:	package/tzdata/
 F:	package/zic/
 
-- 
2.7.4
